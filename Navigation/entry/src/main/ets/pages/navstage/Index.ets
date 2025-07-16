import { pageStack } from './utils'

@Entry
@ComponentV2
struct Index {
  build() {
    Navigation(pageStack){

      Column(){
        Text("首页").width('100%')
        Button("去列表").onClick(()=>{
          pageStack.pushPath({ name: 'list' })
        })
      }

    }
    .title("首页")
  }
}