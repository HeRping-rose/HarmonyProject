@ComponentV2
export  struct Order {
  @Local title: string = 'Order';

  build() {
    Column(){
      Text(this.title)
    }
  }
}