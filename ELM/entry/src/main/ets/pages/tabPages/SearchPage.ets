@ComponentV2
export  struct SearchPage {
  @Local title: string = 'Search';

  build() {
    Column(){
      Text(this.title)
    }
  }
}