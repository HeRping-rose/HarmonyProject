@ComponentV2
export struct ServiceGrid {
  build() {
    GridRow({ columns: 4,gutter:10}) {
      //我的喜欢
      this.gridItem({
        label: '我的喜欢',
        icon: $rawfile('icon_like.svg'),
      })
      this.gridItem({
        label: '我的收藏',
        icon: $rawfile('icon_collect.svg'),
      })
      this.gridItem({
        label: '播放记录',
        icon: $rawfile('icon_record.svg'),
      })
      this.gridItem({
        label: '声音小记',
        icon: $rawfile('icon_note.svg'),
      })

      
      // // 草稿箱
      this.gridItem({
        label: '草稿箱',
        icon: $rawfile('icon_draft.svg'),
      })

      // 收听时长
      this.gridItem({
        label: '收听时长',
        icon: $rawfile('icon_time.svg'),
      })
      //钱包
      this.gridItem({
        label: '钱包',
        icon: $rawfile('icon_wallet.svg'),
      })
      //更多服务
      this.gridItem({
        label: '更多服务',
        icon: $rawfile('icon_more.svg'),
      })
    }
    .padding(16)
  }

  @Builder
  gridItem(params:Param) {
    Column({ space: 4 }) {
      Image(params.icon).width(32).height(32)
      Text(params.label).fontSize(12)
    }
    .justifyContent(FlexAlign.Center)
  }
}
interface Param{
  label:string;
  icon:ResourceStr;
}

class Params{
  label:string ='';
  icon:ResourceStr='';
  constructor(label:string,icon:ResourceStr){
    this.label= label;
    this.icon=icon;
  }
}
