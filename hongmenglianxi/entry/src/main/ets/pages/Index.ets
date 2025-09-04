// import { PictureManagerComponent } from './components/PictureManager';
import { PictureManagerComponent } from '../components/PictureManager';
import { taskpool } from '@kit.ArkTS';

// 任务函数1 用于获取一个网络请求
@Concurrent
async function getData(){
  // <String> 用于给 Promise成功时所返回的数据类型
  let res=await new Promise<string>((resolve,reject)=>{
    //发请求
    setTimeout(()=>{
      resolve('请求成功')  //请求成功得到数据
    },2000)
  })
  console.log(res)
  return res
}

// 任务函数2 用于下载视频
@Concurrent
async function downloadVideo() {
  // <String> 用于给 Promise成功时所返回的数据类型
  let res = await new Promise<string>((resolve, reject) => {
    //发请求
    setTimeout(() => {
      resolve('用于下载视频') //请求成功得到数据
    }, 2000)
  })
  console.log(res)
  return res
}

// 任务函数3 发邮件
@Concurrent
async function sendEmail() {
  // <String> 用于给 Promise成功时所返回的数据类型
  let res = await new Promise<string>((resolve, reject) => {
    //发请求
    setTimeout(() => {
      resolve('用于发邮件') //请求成功得到数据
    }, 2000)
  })
  console.log(res)
  return res
}

// @Concurrent 1.添加装饰器
@Concurrent //任务池可执行的任务函数  同时运行多个任务 并发运行
function sum() {
  let result = 0;
  for (let i = 0; i < 10000000; i++) {
    result += i;
  }
  return result;
}

@Entry
@Component
struct Index {
  @State globalTask: Record<string,taskpool.Task> = {}
  @State message: string = 'Hello World';
  async todo() {
    // TODO:
    let start= Date.now();
    let result = sum()
    let result2 = sum()
    let end= Date.now();
    console.log(`结果是${result}, 耗时：${end-start}ms`)
  }

  async todo2() {
    // TODO:
    let start = Date.now();
    //2.导入taskpool模块  传入一个函数
    //3.调用taskpool.execute()方法  执行 sum()方法
    // execute本质是将sum()方法(任务函数)放入任务池中执行
    // 任务会在什么时候执行,要看任务池的优先级,以及负载,
    // 如果现在有空余线程,则立即执行,否则会放入任务池中,等待执行
    // execute的返回值是一个promise对象,promise对象中封装了任务的结果他可以链式调用then方法,获取任务的结果

    //不能是设置优先级以及取消任务
    let result = taskpool.execute(sum)
    result.then((res) => {
      console.log(`结果是${res}`)
    })
    let result2 = taskpool.execute(sum)
    //卡住 异步等待多个promise的成果返回 如果全部返回则返回一个数组 all才会触发
    let result3=await Promise.all([result,result2])
    let end = Date.now();
    console.log(`结果是${result3[0]}, 耗时：${end - start}ms`)
  }
  //执行可调度的任务方法
  async todo3() {
    //1. 创建 包装成一个 taskpool任务 只有是这个任务才接受设置优先级和取消任务
    this.globalTask.task1 = new taskpool.Task(getData);
    this.globalTask.task2 = new taskpool.Task(downloadVideo);
    this.globalTask.task3 = new taskpool.Task(sendEmail);

    //执行任务   可以设置第二个参数 设置优先级 high/medium/low/idle空闲
    //任务还没有开始之前可以取消 一旦开始执行之后不能取消
    taskpool.execute(this.globalTask.task1, taskpool.Priority.IDLE)
    taskpool.execute(this.globalTask.task2, taskpool.Priority.HIGH)
    taskpool.execute(this.globalTask.task3, taskpool.Priority.LOW)

    // taskpool.execute(getData)
    // taskpool.execute(downloadVideo)
    // taskpool.execute(sendEmail)
  }
  @State globalGroup: Record<string,taskpool.TaskGroup> = {}
  //4. 任务组  如果现在需要多个任务同时执行 完成之后在做后续处理 用到任务组 类比Promise.all()
  async todo4(){
    this.globalTask.task1 = new taskpool.Task(getData);
    this.globalTask.task2 = new taskpool.Task(downloadVideo);
    this.globalTask.task3 = new taskpool.Task(sendEmail);

    //2.添加任务组
    this.globalGroup.group=new taskpool.TaskGroup() //可以往这个组中添加任务
    this.globalGroup.group.addTask(this.globalTask.task1)
    this.globalGroup.group.addTask(this.globalTask.task2)
    this.globalGroup.group.addTask(this.globalTask.task3)
    //3.执行任务组  第二各参数 设置优先级
    // res只会在任务组全部完成之后才会返回
    // ,如果任务组有失败的任务 则立即报错 返回这个一个报错信息
    const result=await taskpool.execute(this.globalGroup.group,taskpool.Priority.MEDIUM)
    console.log(`结果是${result}`)
    let  res =result.map((item) => item.toString())
    console.log(res+'')

  }

  build() {
    RelativeContainer() {
      PictureManagerComponent()

      Column(){
        Button('仅主线程开始计算').onClick((event: ClickEvent) => {
          this.todo()
        })
        Button('多线程开始计算').onClick((event: ClickEvent) => {
          this.todo2()
        })
        Button('执行可调度的任务方法').onClick((event: ClickEvent) => {
          this.todo3()
        })
        Button('取消任务').onClick((event: ClickEvent) => {
          taskpool.cancel(this.globalTask.task1)
        })
        Button('执行任务组').onClick((event: ClickEvent) => {
          this.todo4()
        })
        Button('取消任务组').onClick((event: ClickEvent) => {
          taskpool.cancel(this.globalGroup.group)
        })

      }
      .position({ left: 0, top: '60%' })

    }
    .height('100%')
    .width('100%')
  }
}