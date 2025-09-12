@ComponentV2
export  struct Mine {
  @Local title: string = 'Mine';

  build() {
    Column(){
      Text(this.title)
    }
  }
}