import { Context } from '@kit.AbilityKit'

class savedContext{
  context:Context

  constructor(context: Context){
  this.context=context
  }
}

@ObservedV2
class OutArea{
  @Trace topHeight:number
  @Trace bottomHeight:number
  constructor(topHeight:number,bottomHeight:number){
    this.topHeight=topHeight
    this.bottomHeight=bottomHeight
  }
}

interface TabInterface {
  icon: ResourceStr //resourse
  selectIcon: ResourceStr
  name: string
  title: string
}

export { savedContext , OutArea , TabInterface  }