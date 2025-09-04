/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BusinessError } from '@ohos.base';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

/**
 * 实现步骤：
 * 点击首页"+"，通过photoViewPicker.select()接口,通过传入参数PhotoSaveOptions图库对象，返回的用户选择的图片并显示在页面中，
 * 从而实现手机相册并进行图片预览和选择。
 * photoViewPicker参考文档：
 * https://docs.openharmony.cn/pages/v3.2/zh-cn/application-dev/reference/apis/js-apis-file-picker.md/#photoviewpicker
 */
@Component
export struct SelectPictures {
  @State uris: Array<string> = []; // 全局变量保存图库选择的结果uri
  @State photoCount: number = 0; // 全局变量控制选择图片的显示

  // 接口采用promise异步返回形式，传入可选参数DocumentSelectOptions对象，返回选择文件的uri数组。
  async getFileAssetsFromType() {
    const photoSelectOptions = new photoAccessHelper.PhotoSelectOptions(); // 创建图片-音频类型文件-预览的图库选项实例
    // 选择媒体文件类型和选择媒体文件的最大数目
    photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE; // 选择媒体文件类型为Image
    photoSelectOptions.maxSelectNumber = 2; // 选择媒体文件的最大数目
    // TODO：知识点：创建图库选择器实例，调用photoViewPicker.select()接口拉起图库界面进行文件选择，文件选择成功后，返回photoSelectResult结果集。
    const photoViewPicker = new photoAccessHelper.PhotoViewPicker();
    photoViewPicker.select(photoSelectOptions)
      .then((photoSelectResult) => {
        // select返回的uri权限是只读权限，需要将uri写入全局变量@State中即可进行读取文件数据操作。
        this.uris = photoSelectResult.photoUris;

        //发送请求到服务器
        /*
         *
       //   1.4判断用户取消了选择图片，则组织下面代码的继续运行
    if (res.photoUris.length === 0) {
      promptAction.showToast({ message: "用户取消图片选择" })
      return
    }
    //   1.5准备好一个图片的完整路径：
    let ext = 'jpg' // 图片扩展名
    let fileName = Date.now().toString() // 图片名称
    let cacheDir = getContext().cacheDir // 获取应用程序的缓存目录
    let fullPath = cacheDir + '/' + fileName + '.' + ext // 完整的图片路径
    let fullFileName = fileName + '.' + ext

    //   1.6通过上面获取的文件路径利用fs.openSync打开图片文件——>fs.copyFileSync将图片拷贝到缓存目录：
    let file = fs.openSync(res.photoUris[0], fs.OpenMode.READ_ONLY)
    fs.copyFileSync(file.fd, fullPath)
    AlertDialog.show({ message: '图片拷贝成功' })

    //  2.利用request.uploadFile方法完成应用程序缓存目录下的文件上传操作
    //   2.1通过上面的fullFileName获取缓存文件路径：
    let uploadFilePath = `internal://cache/${fullFileName}`
    //   2.2准备reqeust.uploadFile ：
    // 需要传入两个参数：上下文+上传文件的配置参数
    let uploador = await request.uploadFile(getContext(), {
      method: 'POST',
      url: 'https://example',
      header: {
        "Content-Type": "multipart/form-data",
        "Authorization": `Bearer ${this.currentUser.token}`
      },
      // name指的是接口中的body中的参数名称，不能写错一定要和接口保持一致
      // uri指的是应用程序缓存中的图片//filename：文件名称
      // type文件类型，也就是扩展名
      files: [{
        name: 'file',
        uri: uploadFilePath,
        filename: fullFileName,
        type: ext
      }],
      data: []  // 因为本接口除了上传文件之外，无需接收其他文本数据，所以空着即可
    })

    // 3.注册uploador对象上的两个事件：一个progress监听上传进度，一个fail监听上传失败的异常获取
    uploador.on('progress', (uploadSize, totalSize) => {
      // 这个回调函数是随着文件的上传会被不间断的触发执行，每次的uploadSize的值会增加
      // 但是totalSize永远都是当前上传图片的大小
      // 可以通过判断uploadSize === totalSize表示上传完成，我们就可以做完成后端逻辑处理
      Logger.info('上传:', uploadSize + ' / ' + totalSize)
      if (uploadSize === totalSize) {
        AlertDialog.show({ message: '图片上传完成' })
      }
      // 由于此函数会被多次调用，所以我们可以在这个函数中计算处当前上传的进度百分比
      // Logger.info('上传:',uploadSize + ' / ' + totalSize)
      let parcentStr = ((uploadSize / totalSize) * 100).toFixed(0).toString()
      Logger.info('上传:', parcentStr)
    })

    // 监听上传失败的事件
    uploador.on('fail', (err) => {
      AlertDialog.show({ message: JSON.stringify(err) })
    })
  }
  * */
        this.photoCount = this.uris.length;
      }).catch((err: BusinessError) => {
      return;
    })
  }

  build() {
    Column() {
      Column() {
        Text($r("app.string.photopickandsave_choice_photo"))
          .fontSize($r('app.string.ohos_id_text_size_headline'))
          .fontWeight(FontWeight.Medium)
          .margin({ bottom: $r('app.string.ohos_id_elements_margin_vertical_m') })
        Text($r("app.string.photopickandsave_upload_desc"))
      }
      .backgroundColor($r('app.color.ohos_id_color_sub_background'))
      .borderRadius($r('app.string.ohos_id_corner_radius_default_m'))
      .padding($r('app.string.ohos_id_card_padding_start'))
      .margin($r('app.string.ohos_id_card_margin_start'))

      Column() {
        Image(this.photoCount > 0 ? this.uris[0] : $r("app.media.photopickandsave_add"))
          .id('select_photo')
          .objectFit(this.photoCount > 0 ? ImageFit.Contain : ImageFit.None)
          .width('50%')
          .height('30%')
          .onClick(() => {
            // TODO：知识点：通过调用getFileAssetsFromType()中的photoViewPicker.select()拉起图库界面进行图片选择。
            this.getFileAssetsFromType();
          })
          .margin({ bottom: $r('app.string.ohos_id_elements_margin_vertical_m') })

        Image(this.photoCount > 1 ? this.uris[1] : '')
          .visibility(this.photoCount > 1 ? Visibility.Visible : Visibility.None)
          .objectFit(this.photoCount > 1 ? ImageFit.Contain : ImageFit.None)
          .width('50%')
          .height('30%')
          .onClick(() => {
            // TODO：知识点：通过调用getFileAssetsFromType()中的photoViewPicker.select()拉起图库界面进行图片选择。
            this.getFileAssetsFromType();
          })
      }
      .margin($r('app.string.ohos_id_card_margin_start'))
    }
    .height('100%')
  }
}
