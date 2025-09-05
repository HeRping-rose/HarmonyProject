import { ImageInfo } from "../../viewmodels"

// 任务函数
@Concurrent
export  function loadImg(count: number) {
  //准备一个空数组
  let imgArr: ImageInfo[] = []

  for (let i = 0; i < count; i++) {
    imgArr.push(new ImageInfo('app.media.img_' + i + '.jpg', 'img' + i))
  }
  // imgArr.push(new ImageInfo('app.media.img_1.jpg','img1'))
  // imgArr.push({ image: 'app.media.img_2.jpg', txt: 'img2' })


  return imgArr
}
