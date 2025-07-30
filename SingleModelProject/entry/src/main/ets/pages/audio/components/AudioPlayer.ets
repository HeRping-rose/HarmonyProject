import { media } from '@kit.MediaKit'
import { fileIo } from '@kit.CoreFileKit'
import { logger } from '../../../commons/utils'
import { AudioItem } from '../../../models'
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit'

@ComponentV2
export struct AudioPlayer {
  @Param item: AudioItem = {} as AudioItem
  @Local playing: boolean = false
  @Local total: number = 0
  @Local value: number = 0
  avPlayer: media.AVPlayer|null = null
  context = this.getUIContext().getHostContext() as common.UIAbilityContext

  // async startPlay() {
  //   try {
  //     const file = fileIo.openSync(this.item.path, fileIo.OpenMode.READ_ONLY)
  //     const avPlayer = await media.createAVPlayer()
  //     avPlayer.on('stateChange', state => {
  //       if (state === 'initialized') {
  //         avPlayer.prepare()
  //       } else if (state === 'prepared') {
  //         avPlayer.loop = true
  //         this.total = avPlayer.duration
  //         avPlayer.play()
  //       }
  //     })
  //     // 当前播放时间改变
  //     avPlayer.on('timeUpdate', (time) => {
  //       this.value = time
  //     })
  //     avPlayer.url = `fd://${file.fd}`
  //     this.avPlayer = avPlayer
  //     this.playing = true
  //   } catch (e) {
  //     logger.error('startPlay', JSON.stringify(e))
  //   }
  // }
  //
  // stopPlay() {
  //   if (this.avPlayer) {
  //     this.avPlayer.stop()
  //     this.avPlayer.release()
  //     this.playing = false
  //   }
  // }

  async startAvPlayer() {

    const avPlayer = await media.createAVPlayer()
    ///data/app/el2/100/base/com.ron.single_model_project/haps/entry/files/1753882464557.m4a
    // const filePath = this.context.filesDir + '/' + '1753882464557' + '.m4a'
    // const filePath = this.item.path
    // console.log('filePath' + filePath)
    ///data/app/el2/100/base/com.ron.single_model_project/haps/entry/files/1753759642415.m4a
    ///data/app/el2/100/base/com.ron.single_model_project/haps/entry/files/1753769844141.m4a
    // const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY)
    console.log('nameId'+this.item.name +  "id:"+this.item.id)
    console.log('path:'+ this.item.path)
    const file = fileIo.openSync(this.item.path, fileIo.OpenMode.READ_ONLY)
    console.log('file'+ JSON.stringify(file))
    avPlayer.url = `fd://${file.fd}`
    avPlayer.on('stateChange', state => {
      if (state == 'initialized') {
        avPlayer.prepare()
        console.log('initialized')
      } else if (state == 'prepared') {
        this.total = avPlayer.duration
        avPlayer.play()
        this.playing = true
      }
    })
    // 监听事件改变
    avPlayer.on('timeUpdate', time => {
      this.value = time
    })
    this.avPlayer = avPlayer
  }

  async endAvPlayer() {
    if (this.avPlayer) {
      this.avPlayer.stop()
      this.avPlayer.release()
    }
  }

  async aboutToAppear(): Promise<void> {
    console.log('Received item:', JSON.stringify(this.item));

    if (this.playing) {
      await this.startAvPlayer()
    }
  }

  async aboutToDisappear(): Promise<void> {
    await this.endAvPlayer()
  }

  build() {
    Column({ space: 20 }) {
      Image($r('app.media.ic_mine_audio'))
        .width(100)
        .aspectRatio(1)
      Text(this.item.name)
        .fontSize(18)

      Row({ space: 20 }) {
        Image(!this.playing ? $r('sys.media.ohos_ic_public_play') : $r('sys.media.ohos_ic_public_pause'))
          .width(24)
          .aspectRatio(1)
          .onClick(() => {
            if (!this.playing) {
              this.startAvPlayer()
            } else {
              this.endAvPlayer()
            }
          })
        Progress({ value: this.value, total: this.total })
          .layoutWeight(1)
          .margin({ top: 20, bottom: 20 })
      }
      .width('80%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.white'))
    .onDisAppear(() => {
      this.endAvPlayer()
    })
  }
}