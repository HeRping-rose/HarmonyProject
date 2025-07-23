import { HcNavBar } from "../../commons/components/HcNavBar"
import { Agreement, webParams } from "../../models"
import { webview } from "@kit.ArkWeb"
import { AppStorageV2 } from "@kit.ArkUI"

@ComponentV2
export struct web{
  @Local title:string=''
  @Local url:string=''
  controller=new webview.WebviewController
  build() {
    NavDestination(){
      Column() {
        HcNavBar({ title: this.title, showRightIcon: false })

        Web({
          src: this.url,
          controller:this.controller
        })
          .onPageEnd(()=>{
            console.log("页面加载完成时")
          })
          .onScroll(()=>{
            // console.log('页面滚动时')
          })
          .onOverScroll((event) => {
            console.log('到了开头或者结尾时')
            console.log(event.yOffset.toString())
            if(event.yOffset>0){
              console.log("到底部了")
              let agree: Agreement=AppStorageV2.connect(Agreement,'AgreeKey',()=>new Agreement())!
              if(this.title==='用户协议'){
                agree.toBottom1=true
              }else {
                agree.toBottom2=true
              }
            }
          })
      }
    }
    .hideTitleBar( true)
    .onReady((ctx:NavDestinationContext)=>{
      let res = ctx.pathInfo.param as webParams
      this.title=res.title
      this.url=res.url
    })
  }
}

@Builder
export function webBuilder(){
  web()
}
