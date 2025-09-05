import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
// 公共事件模块的二次封装 他提供了系统级别的交互能力  进程之间通信
// 如通讯  ,核心   发布-订阅
//默认情况下使用 会比较复杂 进行 第二次封装  对他所实现的 发布订阅的方法 做一次二次封装
//目标是使用起来 与 emitter 的感受类似

class CommonEventManager {
  //全局 把创建好的订阅者 保存到全局 是为了可能之后还有操作
  // 例如:发布公共事件、订阅公共事件、以及退订公共事件。
  //
  // 说明
  subscriber: commonEventManager.CommonEventSubscriber|undefined =undefined

  //发布者
  publish(eventName: string, data: string='') {
    commonEventManager.publish(eventName,{data: data}, (err: BusinessError) => {
      // if (err) {
      //   console.error(`Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
      //   return;
      // }
      // console.info(`Succeeded in publishing common event.`);
    });

  }

  //订阅者
  subscribe(eventName: string, callback: (event: string) => void) {
    // 1.创建订阅者
    commonEventManager.createSubscriber({ events: [eventName]}, (err: BusinessError, data) => {
     // 2.得到全局的订阅者  当创建好一个订阅者后的回调中的data就是我们创建好的订阅者
      this.subscriber=data
      // 3. 订阅事件
      if(this.subscriber){
        //公共事件模块提供的订阅方式 参数1订阅者(人)  订阅者信息  参数2回调函数(事件)
        commonEventManager.subscribe(this.subscriber,(err,data)=>{
          //参数中data对象中的形参 .data就是我们具体传递的内容
          if(data.data){
            // callback来接收参数
            callback(data.data)
          }
        })
      }
    })

  }

  //退订
  unsubscribe() {
    commonEventManager.unsubscribe(this.subscriber, (err: BusinessError) => {
      if (err) {
        console.error(`Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
        return;
      }
      // subscriber不再使用时需要将其置为undefined，避免内存泄露
      this.subscriber = undefined;
      console.info(`Succeeded in unsubscribing.`);
    });
  }
}

export const commonEvent = new CommonEventManager();
// commonEvent.publish('定义的事件名', '哈哈哈')
// commonEvent.subscribe('定义的事件名', (event) => {})