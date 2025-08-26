export class ListDataSource<T> implements IDataSource{
  private originArr:T[]=[]  //原始列表数据
  //listeners: 手监听的列表
  //DataChangeListener 鸿蒙自带接口 ,数据发生那个变化时通知视图更新
  private listeners:DataChangeListener[]=[]
  //返回列表长度
  totalCount(): number {
    return this.originArr.length
    throw new Error("Method not implemented.");
  }

  //返回列表数据 根据输入索引返回 数据
  getData(index: number): T {
    return this.originArr[index]
    throw new Error("Method not implemented.");
  }

  //注册数据监听 数据改变监听器  参数:受监听的对象
  registerDataChangeListener(listener: DataChangeListener): void {
    //看列表中是否有该监听器 如果不包含则添加
    // if(!this.listeners.includes(listener)){
    //   this.listeners.push(listener)
    // }
    if(this.listeners.indexOf( listener)==-1){
      //找不到返回-1  不包含该监听器
      this.listeners.push(listener)
    }
    // throw new Error("Method not implemented.");
  }

  //注销数据监听 参数:受监听的对象
  unregisterDataChangeListener(listener: DataChangeListener): void {
    //删除监听器 如果有包含则删除该监听器
    let index=this.listeners.indexOf(listener)
    if(index!=-1){
      // 添加 修改 移除 数组元素
      //删除(起始索引,删几项)
      this.listeners.splice(index,1)
    }

  }

  //接收原始数据 并将原始数据导入到受监听的列表listeners中
  loadData(data:T[]){
    this.originArr=data
    this.listeners.forEach((listener)=>{
      listener.onDataReloaded()   //通知视图更新 重新加载数据
    })
  }
}