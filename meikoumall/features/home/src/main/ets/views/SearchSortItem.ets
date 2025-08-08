import { SortField, SortMethod } from '../viewmodels'

@ComponentV2
export struct SearchSortItem {
  // 筛选字段
  @Param
  field: SortField = 'publishTime'
  // 显示的文本
  @Param
  label: string = ''
  // 状态变量，接收父组件的状态属性
  // 父组件的筛选字段
  @Param sortField: SortField = 'publishTime'
  // 父组件的排序方法
  @Param sortMethod: SortMethod = 'desc'

  // 定义子传父的函数  自定义事件 回传field: SortField, method: SortMethod
  @Event
  onSortChange: (field: SortField, method: SortMethod) => void = () => {
  }

  build() {
    Row() {
      Text(this.label)
        .fontWeight(500)
        .fontSize(14)
        .fontColor(this.sortField === this.field ? $r('[basic].color.black') : $r('[basic].color.gray'))
      Column() {
        Image($r('[basic].media.ic_public_up'))
          .width(15)
          .height(6)
          .fillColor(this.sortField === this.field && this.sortMethod === 'asc' ? $r('[basic].color.black') :
          $r('[basic].color.gray'))
        Image($r('[basic].media.ic_public_down'))
          .width(15)
          .height(6)
          .fillColor(this.sortField === this.field && this.sortMethod === 'desc' ? $r('[basic].color.black') :
          $r('[basic].color.gray'))
      }
      .justifyContent(FlexAlign.Center)
    }
    .onClick(() => {

      // 排序字段相同,修改排序方式
      if (this.field === this.sortField) {
        // field: SortField = 'publishTime' 默认
        // @Param sortField: SortField = 'publishTime' 默认
        // 内部调用 需要把选择好的排序字段和排序方式传给父组件
        this.onSortChange(this.field, this.sortMethod === "asc" ? "desc" : 'asc')
      } else {
        // 排序字段不同，排序方式 desc，修改排序字段
        //SortField:'publishTime' | 'orderNum' | 'price'  // 排序字段
        this.onSortChange(this.field, "desc") // 如果选择不是一个字段 默认按照倒序
      }


    })
  }
}