interface IList{
  text: string
  color:ResourceColor
}


@ComponentV2
struct Tag {
  @Local list: IList[] = [
     { text: "简单", color: $r("app.color.common_green") },
     { text: "简单", color: $r("app.color.common_green") },
     { text: "一般", color: $r("app.color.common_blue") },
     { text: "一般", color: $r("app.color.common_blue") },
     { text: "困难", color: $r("app.color.common_main_color") },
  ];
  @Param level: number = 1
  @Param font: string = ""
  @Param color: ResourceColor =''
  @Param difficulty: number = 1

  build() {
    Column(){
      Text(this.font || this.list[this.level-1].text)
        .fontColor(this.color || this.list[this.level-1].color)
        .backgroundColor("#ddd")
        .borderRadius(5)
        .padding({left: 15, right: 15, top: 5, bottom: 5})

    }
  }
}

export { Tag }