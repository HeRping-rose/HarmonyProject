
// 参数1 event 用户接收传入的实参 接收外部传入的数据
// 参数2 上下文对象
// 参数3 回调函数 当云函数执行完成后 会调用这个回调函数 把结果传给用户
// 参数4 logger 日志对象
let myHandler = async function (event, context, callback, logger) {
  logger.info(event);
  let total:number=0
  // do something here
  for (let index = 0; index < 100; index++) {
     total += 1;
  }

  callback({
    code: 0,
    // desc: "Success." //description 描述 字段名都是任意的
    total: total+event.request
  });
};

//单个函数 很普通的函数 把这个函数传到华为的服务器中 (云端)
// 计算函数的过程发生在云端 节约用户cpu的开销

export { myHandler };