import { auth } from "../../../commons/utils/auth"
import { QuestionDetail, UserClass } from "../../../models"
import { componentSnapshot, promptAction } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'
import { common } from '@kit.AbilityKit'
import { fileIo as fs, fileUri } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

@CustomDialog
export  struct  myQuestionSharedDialog{
  @Prop item: QuestionDetail
  user: UserClass = auth.getUser()
  controller: CustomDialogController
  @State pixelMap: image.PixelMap | ResourceStr = ""
  context = this.getUIContext().getHostContext() as common.UIAbilityContext

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column({ space: 20 }) {
        Image($r('app.media.ic_interview_logo'))
          .width(40)
          .height(40)
        Text('面试通，搞定企业面试题')
        Divider()
          .strokeWidth(0.5)
          .color($r('app.color.common_gray_border'))
        Text('大厂面试题：' + this.item.stem)
          .fontSize(12)
          .maxLines(2)
          .fontWeight(600)
          .width('100%')
          .lineHeight(24)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        QRCode(this.item.id)
          .width(160)
          .height(160)
          .alignSelf(ItemAlign.Center)
        Text('扫码查看答案')
          .fontSize(12)
          .alignSelf(ItemAlign.Center)
        Blank()
        Text('分享来自：' + this.user.nickName || this.user.username)
          .fontSize(12)
      }
      .id('share')
      .padding(20)
      .alignItems(HorizontalAlign.Start)
      .width(300)
      .height(500)
      .backgroundColor($r('app.color.white'))


      Row() {
        // Text('保存到本地')
        SaveButton({
          icon: SaveIconStyle.FULL_FILLED,
          text: SaveDescription.SAVE_IMAGE,
          buttonType: ButtonType.ROUNDED_RECTANGLE
        })
          .onClick((event, result) => {
            //   检测是否获得临时存储操作权限
            if (result == SaveButtonOnClickResult.SUCCESS) {

              this.saveIamge()
            }
          })
          .fontColor($r('app.color.white'))
          .fontSize(14)
          .padding(12)
          .backgroundColor($r('app.color.common_main_color'))
      }
      .borderRadius({ topLeft: 8 })
      .clip(true)
    }
    .borderRadius(8)
    .clip(true)
  }

  async saveIamge() {
    // 截图  保存成了pixelMap格式
    let img = componentSnapshot.getSync('share')
    this.pixelMap = img
    //   将pixelMap格式打包成常见格式
    let imgPack = image.createImagePacker() // 图片打包器
    // 打包成数据
    // buffer是一个二进制的数据格式  [0101010] 用数组来装的是arrayBuffer
    // 大图片  视频 传输时 不可能一次性写入 一段一段的传 可以控制每次传输的大小 监控传输过程
    // arrayBuffer 只是一个载体
    let arrayBuffer = await imgPack.packToData(img, {
      format: "image/jpeg", //把源文件 打包成jpeg
      quality: 100  //1-100 图片质量
    })
    //   要把图片存到哪里  (路径)  缓存 中 cache
    //   鸿蒙为了安全性不允许直接把图片直接存到像册 只能先存到 缓存(沙箱) 中 再由系统 移动到相册
    let imgPath = this.context.cacheDir + "/" + Date.now() + ".jpg" // 路径 uri

    //   4.文件操作 存储
    // 打开图片
    let file = fs.openSync(imgPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    // 写入文件  fd : 文件描述符 内存中 标定图片的唯一标识
    let writeLen = fs.writeSync(file.fd, arrayBuffer);
    // 关闭当前文件的操作
    fs.closeSync(file);
    //提示 步骤正常 保存到cache中
    promptAction.openToast({ message: "保存成功到cache中" })

    // 5, 像册操作 (获取权限 )
    //   创建实例  获得相册模块 的实例对象 传context参数 是希望 由当前 窗口来get 该能力
    let phHelper = photoAccessHelper.getPhotoAccessHelper(this.context)
    //   创建请求 MediaAssetChangeRequest 访问媒体资产变更请求(从缓存 中 变更到 相册)
    //   fileUri:统一资源定位符  要求 file://entry/src/file/xxx/cache/xxx.jpg
    //   imgPath:用于定位图片路径  ../../cache/xxx.jpg
    let uri = fileUri.getUriFromPath(imgPath)

    let createChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(this.context, uri)
    //  提交请求更改
    await phHelper.applyChanges(createChangeRequest)
    // 提示 步骤正常 保存到相册中
    promptAction.openToast({ message: "保存成功到相册中" })


  }
}