import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { promptAction } from '@kit.ArkUI';
import { BusinessError, request } from '@kit.BasicServicesKit';
import { common, Context } from '@kit.AbilityKit';

// workerPort 是worker之间的线程间通信的端口(主线与子线程)
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
let task: request.DownloadTask

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * 用于接收主线程发送的消息
 * The event handler is executed in the worker thread.
 *
 *
 * @param event message data
 */
workerPort.onmessage = (event: MessageEvents) => {
  // 接收到主线程发来的消息   event.data 就是主线程发来的数据{action: "hello world"}
  let msg:MsgType = event.data as MsgType;
  if(msg.action=='download'){
    promptAction.openToast({message:'开始下载'})
    myDownloadFile(msg.context)
  }else if(msg.action=='stop'){
    promptAction.openToast({message:'停止下载'})
    workerPort.close() //关闭worker线程 一旦关闭 ,线程内存会被销毁,这个线程中的下载任务当然也会被取消
  }else if(msg.action=='pause'){
    // worker 通知给主线程
    task.suspend((err: BusinessError, result: boolean) => {
      if (err) {
        console.error(`Failed to pause the download task. Code: ${err.code}, message: ${err.message}`);
        return;
      }
      console.info('Succeeded in pausing the download task.');
      // workerPort.postMessage({
      //   action:'pause',
      //   pause:result
      // })
    });

    promptAction.openToast({message:'暂停下载'})


  }else if(msg.action=='resume'){
    promptAction.openToast({message:'继续下载'})
    //恢复下载
    task.restore().then((result: boolean) => {
      console.info('Succeeded in resuming the download task.')
    }).catch((err: BusinessError) => {
      console.error(`Failed to resume the download task. Code: ${err.code}, message: ${err.message}`);
    });

  }
  // console.log('workerPort.onmessage:', event.data);
};

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * 如果主线程(发消息时出错)，则调用此方法
 * The event handler is executed in the worker thread.
 *
 * @param event message data
 */
workerPort.onmessageerror = (event: MessageEvents) => {
};

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *主线程与子线程之间通讯 中出现的报错会触发
 * @param event error message
 */
workerPort.onerror = (event: ErrorEvent) => {
};

interface MsgType{
  action: 'download'|'stop'|'pause'|'resume';
  context: common.UIAbilityContext;
}
//下载任务函数
async function  myDownloadFile( context: common.UIAbilityContext){
  //下载任务已经开始了
  task=await request.downloadFile(context,{
    url:'https://contentcenter-vali-drcn.dbankcdn.cn/pvt_2/DeveloperAlliance_package_901_9/f1/v3/JNYiKdosS_e9_J0168bwdA/devecostudio-windows-5.0.13.230.zip?HW-CC-KV=V1&HW-CC-Date=20250905T062824Z&HW-CC-Expire=7200&HW-CC-Sign=82BB1E98967524192C3ADA90370CC7019C7719A54A81B2950B692F0F996AB128',
    filePath:context.filesDir+'/'+Date.now()+'.zip'
  })
  task.on('complete',()=>{
    //下载完成时 要做的事件
    workerPort.close() //关闭worker线程 一旦关闭 ,线程内存会被销毁,这个线程中的下载任务当然也会被取消
  })
  //下载任务进度事件 在每次进度改变时候都会触发 ,并会告诉你当前的进度 和 总进度
  task.on('progress',(current, total)=>{

    console.log(`${current/total*100}`)
    //  把这个进度发送给主线程
    workerPort.postMessage({
      action:'progress',
      progress:{
        current:current,
        total:total
      }
    })
  })
}