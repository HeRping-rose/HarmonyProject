import { relationalStore, ValuesBucket } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'

@Entry
@ComponentV2
struct TestSqlPage {
  context =this.getUIContext().getHostContext() as common.UIAbilityContext
  tableName:string='article'
  store:relationalStore.RdbStore|null=null
  @Local list: Article[] = [] //接收数据
  async createStore(){

    const store =await relationalStore.getRdbStore(this.context,{
      name:'test.db'  , //创建的数据库名称
      securityLevel:relationalStore.SecurityLevel.S1  , // 数据库的权限 安全等级
    })
    // 2.创建一张表
    store.executeSql(`
        create table if not exists ${this.tableName}(
        id integer primary key autoincrement,
        title text not null,
        content text not null,
        watch integer not null,
        createTime integer not null
        )

    `)
    this.store=store
  }
  aboutToAppear(): void {
    this.createStore()
  }
  build() {
    Column(){
      Button('测试sql').onClick(()=>{
      })
      //插入一行数据
      Button('插入数据').onClick(async ()=>{
        if(this.store){
          // this.store.executeSql(`insert into ${this.tableName} (title,content,watch,createTime) values('测试数据','测试数据',0,${Date.now()})`)
          let res =await this.store.insert(this.tableName,{
            title:'测试数据',
            content:'测试数据',
            watch:520,
            createTime:Date.now()
          })
          console.log(res.toString())
        }
      })
      // 批量插入数据
      Button('批量插入数据').onClick(async ()=> {
        if(this.store){
          let res = await this.store.batchInsert(this.tableName, [
            {
              title: '测试1',
              content: '测试数据',
              watch: 520,
              createTime: Date.now()
            },
            {
              title: '测试2',
              content: '测试数据',
              watch: 520,
              createTime: Date.now()
            },
            {
              title: '测试3',
              content: '测试数据',
              watch: 520,
              createTime: Date.now()
            }
          ])
          console.log('批量插入成功'+ res)
        }
      })

      // 查询数据
      Button('查询数据').onClick(async ()=> {
        if(this.store){
          let predicate =new relationalStore.RdbPredicates(this.tableName)
          let result = await this.store.query(predicate);
          // 显示查询结果
          console.log(JSON.stringify(result)) //{}
          console.log('行数'+JSON.stringify(result.rowCount)) //行数
        }
      })
      //用querySql查询数据行
      Button('用Sql查询数据行').onClick(async ()=> {
        if(this.store){
          let result = await this.store.querySql(`select * from ${this.tableName}`);
          // 显示查询结果
          console.log('行数'+JSON.stringify(result.rowCount)) //行数
        }
      })
      // 查询所有数据并显示
      Button('查询所有数据并显示').onClick(async ()=> {
        if(this.store){
          let predicate = new relationalStore.RdbPredicates(this.tableName)
          let result = await this.store.query(predicate);
          // res 数据集合 它自带一个游标 ,默认在没有读取到数据时，游标会处于结束状态 值为-1 ,
          // 一旦读取到数据，则游标会处于开始状态 值为0 ,1,2,3,4...
          let list: Article[] = [] //接收数据类型

          while (result.goToNextRow()){
            //goToNextRow() 游标会自动移动到下一行-1->0 如果调整后这一行有数据则返回true 否则返回false
            list.push({
              id: result.getLong(result.getColumnIndex('id'))  ,
              title: result.getString(result.getColumnIndex('title')) ,
              content:  result.getString(result.getColumnIndex('content')),
              watch:  result.getLong(result.getColumnIndex('watch')) ,
              createTime: result.getLong(result.getColumnIndex('createTime'))
            })
          }
          // 关闭循环操作
          result.close()
          console.log('list',JSON.stringify(list))
          this.list = list
        }
      })

      List(){
        ForEach(this.list, (item:Article) => {
          ListItem(){
            Text(item.id+""+item.title)
          }
        })
      }
      //更新数据
      Button('更新数据').onClick(async ()=> {
        if (this.store) {
          let predicate = new relationalStore.RdbPredicates(this.tableName)
          // predicates.equalTo("NAME", "Lisa");
          predicate.equalTo("id", 1)
          let result = await this.store.update({'id': 1, 'title': 'Lisa', 'content': 'Lisa is a good girl'},predicate)

        }
      })





    }
    .margin({top:60})
  }
}

interface Article extends ValuesBucket {
  id:number,
  title:string,
  content:string,
  watch:number,
  createTime:number,
}