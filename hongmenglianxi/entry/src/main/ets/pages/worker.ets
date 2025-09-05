import { MessageEvents, worker } from '@kit.ArkTS'
import { common } from '@kit.AbilityKit'

@Entry
@ComponentV2
struct Index {
  @Local current: number = 0
  @Local total: number = 0
  @Local progress: string|number = 0
  context=this.getUIContext().getHostContext() as common.UIAbilityContext
  @Local myWorker: worker.ThreadWorker|undefined =undefined
  // 任务: 下载一个大文件 request.downloadFile()
  // 如果文件很大 可以再主线程中下载 增加主线程的内存开销 如果他还不是异步执行 那么也会阻塞主线程
  // 因此 一般如果十大文件 可以考虑 开一个 新的线程专门去处理 文件下载

  // 使用 worker完成
  // worker :工人  主线程 雇佣了一个 worker 单独去做一个任务

  // 创建一个worker
  createWorker() {
    // 创建一个worker子线程 他所需要的代码过程都在entry/ets/workers/worker.ets中
    // entry/ets/workers/worker.ets 这个路径一定要是从这个模块中开始查找
    this.myWorker = new worker.ThreadWorker('entry/ets/workers/Worker.ets')
  //   以上的worker已准备就绪 可以下达任务,进行通行
  //   核心就是通信  主线程有发给worker消息的能力 和 收到来自worker消息的能力  同理worker也有

    // 1. 主线程 给worker发送消息
    this.myWorker.postMessage({
      //消息 只管规定是一个对象格式 但这个对象中的内容都是自定义的
      action: 'download',
      context:this.context,
    })
    this.myWorker.onmessage = (e: MessageEvents) => {
      console.log('worker返回的消息:',JSON.stringify(e.data))
      let msg:CallBackMsg=e.data
      if(msg.action=='progress'){
        this.current = msg.progress.current
        this.total = msg.progress.total
        this.progress= (this.current/this.total*100).toFixed(2)
      }
    }

  }
  closeWorker(){
    // 创建一个worker子线程
    // this.myWorker = new worker.ThreadWorker('entry/ets/workers/Worker.ets')
    // 1. 主线程 给worker发送消息
    if(this.myWorker){
      this.myWorker?.postMessage({
        //消息 只管规定是一个对象格式 但这个对象中的内容都是自定义的
        action: 'stop',
        context: this.context,
      })
    }
  }

  pauseFile(){
    if (this.myWorker) {
      this.myWorker?.postMessage({
        //消息 只管规定是一个对象格式 但这个对象中的内容都是自定义的
        action: 'pause',
        context: this.context,
      })
    }
  }
  resumeFile(){
    if (this.myWorker) {
      this.myWorker?.postMessage({
        //消息 只管规定是一个对象格式 但这个对象中的内容都是自定义的
        action: 'resume',
        context: this.context,
      })
    }
  }


  build() {
  //
    Column(){
      //worker主线程 子线程通过收发信息进行通信
      Row(){
        Progress({value:Number(this.progress),total:100}).layoutWeight(1)
        Text(this.progress+'%')
      }
      Button('使用worker下载大文件').onClick(  () =>{
       this.createWorker()
      })
      Button('暂停下载').onClick(async () => {
        this.pauseFile()
      })
      Button('继续下载').onClick(async () => {
        this.resumeFile()
      })
      Button('停止下载').onClick(async () => {
        this.closeWorker()
      })

    }

  }
}
interface CallBackMsg{
  action: 'progress'|'complete',
  progress: Progress
}
interface Progress {
  current: number
  total: number
}
