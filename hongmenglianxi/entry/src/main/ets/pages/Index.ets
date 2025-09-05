// 进程之间通信
// 多线程 一个app可以包含多个 线程去同时执行多个任务
//进程:通常一个app应用只有一个进程  也有特殊的 (双开微信)
//在鸿蒙中 卡片 就是一个独立的进程
// app与卡片之间通信
// 核心 公共事件 发布订阅模式
import { commonEvent } from '../utils/CommonEventManager'

@Entry
@ComponentV2
struct Index {
  build() {
    Column() {
      Text('进程通信')
      Button('发送消息给卡片')
        .onClick(() => {
          // 发送消息
          commonEvent.publish('updateCard', 'hello Card')
        //   依赖entryFormAbility窗口
        })
    }

  }
}