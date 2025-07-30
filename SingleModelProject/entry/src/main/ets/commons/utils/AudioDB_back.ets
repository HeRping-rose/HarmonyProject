

import { relationalStore, ValuesBucket } from '@kit.ArkData'
import { savedContext } from '../../models'
import { AppStorageV2 } from '@kit.ArkUI'
import { AudioItem } from '../../models/index'


class AudioDB {
  store: relationalStore.RdbStore | null = null
  tableName: string = 'audio666_db'

  async initStore() {
    const ctx = AppStorageV2.connect(savedContext)!.context
    const store = await relationalStore.getRdbStore(ctx, {
      name: 'audio666.db',
      securityLevel: relationalStore.SecurityLevel.S1
    })
    //sql 语句必须要严谨 末尾不加逗号
    const sql = `
    create table if not exists ${this.tableName}(
        id integer primary key AUTOINCREMENT,
        user_id text not null,
        name text not null,
        path text not null,
        duration integer not null,
        size integer not null,
        create_time integer not null
    )
    `
    await store.executeSql(sql)
    console.log('store' + JSON.stringify(store))

    this.store = store
  }

  //添加
  async insert(item: AudioItem) {
    // console.log('1111'+JSON.stringify(this.store))
    if (this.store) {
      const rowID = await this.store?.insert(this.tableName, item)
      console.log('rowID' + rowID)
      if (rowID === undefined || rowID === -1) {

        console.log('添加失败')
        return Promise.reject('添加失败')
      } else {
        console.log('添加成功')
        return Promise.resolve()
      }
    }
  }

  //删除
  async delete(id: number) {
    //谓词
    const predicates = new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('id', id)
    // 返回的结果是删除的行数
    const rowCount = await this.store?.delete(predicates)
    if (rowCount === undefined || rowCount <= 0) {
      return Promise.reject('删除失败')
    } else {
      return Promise.resolve()
    }
  }

  //修改
  async update(item: AudioItem) {
    const predicates = new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('id', item.id)
    const rowCount = await this.store?.update(item, predicates)
    if (rowCount === undefined || rowCount <= 0) {
      return Promise.reject('修改失败')
    } else {
      return Promise.resolve()
    }
  }

  //查询
  async query(userId: string) {
    const predicates = new relationalStore.RdbPredicates(this.tableName)
    predicates.equalTo('user_id', userId)
    const resultSet = await this.store?.query(predicates)
    if (!resultSet) {
      console.log('查询失败')
      return Promise.reject('查询失败')
    }

    const list: AudioItem[] = []
    while (resultSet.goToNextRow()) {
      list.push({
        id: resultSet.getLong(resultSet.getColumnIndex('id')),
        user_id: resultSet.getString(resultSet.getColumnIndex('user_id')),
        name: resultSet.getString(resultSet.getColumnIndex('name')),
        path: resultSet.getString(resultSet.getColumnIndex('path')),
        duration: resultSet.getLong(resultSet.getColumnIndex('duration')),
        size: resultSet.getLong(resultSet.getColumnIndex('size')),
        create_time: resultSet.getLong(resultSet.getColumnIndex('create_time')),
      })
    }
    resultSet.close()
    return Promise.resolve(list)
  }
}


export const audioDB = new AudioDB()