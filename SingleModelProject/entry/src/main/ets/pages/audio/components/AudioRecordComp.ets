import { AppStorageV2 } from "@kit.ArkUI"
import { fileIo as fs } from "@kit.CoreFileKit"
import { AudioItem, OutArea } from "../../../models"
import { media } from "@kit.MediaKit"
import { common } from "@kit.AbilityKit"
import { auth } from "../../../commons/utils/auth"
import dayjs from '@mui/dayjs'
import { audioDB } from "../../../commons/utils/AudioDB"

@ComponentV2
export struct AudioRecordComp {
  areaHeight: OutArea = AppStorageV2.connect(OutArea, () => new OutArea(0, 0))!
  avRecorder?: media.AVRecorder |null =null
  fd?: number
  filePath?: string
  timer?: number
  @Local maxAmplitude: number = 0
  //判断是否是正在录制
  @Local isRecording: boolean = false
  user =auth.getUser()
  @Local startTime: number = 0
   //回传录音文件数据  oneAudioData
  @Event returnAudioData:(item:AudioItem)=>void=(item: AudioItem)=>{}

  async startRecord() {
    // 1. 准备一个文件接收录音
    // const ctx = getContext(this)
    const ctx=this.getUIContext().getHostContext() as common.UIAbilityContext
    const filePath = ctx.filesDir + '/' + Date.now() + '.m4a'
    this.filePath = filePath  // 文件路径 保存到全局
    const file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    this.fd = file.fd
    // 2. 准备路由配置对象
    const config: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
      profile: {
        audioBitrate: 100000, // 音频比特率
        audioChannels: 1, // 音频声道数
        audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式，当前只支持aac
        audioSampleRate: 48000, // 音频采样率
        fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // 封装格式，当前只支持m4a
      },
      url: `fd://${file.fd}`
    }
    // 3. 开始录制
    const avRecorder = await media.createAVRecorder()
    await avRecorder.prepare(config)
    await avRecorder.start()
    this.avRecorder = avRecorder
    // 4. 每100ms获取一下声音振幅
    this.timer = setInterval(async () => {
      this.maxAmplitude = await avRecorder.getAudioCapturerMaxAmplitude()
    }, 100)
  }

  async stopRecord() {
    if (this.avRecorder) {
      clearInterval(this.timer)
      await this.avRecorder.stop()
      await this.avRecorder.release()
      fs.closeSync(this.fd)
      this.maxAmplitude = 0
    }
  }

  build() {
    Column() {
      AudioBoComp({ maxAmplitude: this.maxAmplitude })
      Row() {
        Image($r('sys.media.ohos_ic_public_voice'))
          .width(24)
          .aspectRatio(1)
          .fillColor($r('app.color.white'))
          .onClick(async () => {
            // TODO 开始和停止录音
            if(this.isRecording){
              //正在录制  再次点击时停止
              this.stopRecord()
              this.isRecording=false

              let stat=fs.statSync(this.filePath) //需要知道文件信息

              //以上说明录好了一条音频
              //要把这一条存到数据库  (数据库 :只能存信息,文本信息  音频实际上还是在沙箱目录下)
              //文本类信息 :音频路径 音频质量大小 音频时长 音频名字
              let oneAudioData={
                id:null,
                user_id:this.user.id,
                name:dayjs().format('YYYY年MM月DD日_HH:mm:ss'), //dayjs() 不写参数 默认是当前时间
                path:this.filePath,
                duration:Date.now()-this.startTime,  //总时长 单位ms
                size: stat.size, // 音频质量大小
                create_time:Date.now() //数据创建时间
              }  as AudioItem

              this.returnAudioData(oneAudioData) //回传data



              console.log(JSON.stringify(oneAudioData))
              //{"id":null,"user_id":"1","name":"2025年07月30日_15:23:27","path":"/data/storage/el2/base/haps/entry/files/1753860205235.m4a","duration":2095,"size":15572,"create_time":1753860207331}

            }else{
              //没有录制
              this.startRecord()
              this.startTime=Date.now()
              this.isRecording=true
            }

          })
      }
      .justifyContent(FlexAlign.Center)
      .height(50)
      .width(50)
      .borderRadius(25)
      .margin({ top: 20 })
      .backgroundColor(this.isRecording?$r('app.color.common_main_color'): $r('app.color.black'))
    }
    .width('100%')
    .height(240)
    .backgroundColor($r('app.color.common_gray_bg'))
    .padding({
      bottom: this.areaHeight.bottomHeight,
      left: 80,
      right: 80,
      top: 20
    })
  }
}

@ComponentV2
export struct AudioBoComp {
  @Param maxAmplitude: number = 0
  @Local per: number = 0

  @Monitor('maxAmplitude')
  onChange() {
    animateTo({ duration: 100 }, () => {
      if (this.maxAmplitude < 500) {
        this.per = 0
      } else if (this.maxAmplitude > 30000) {
        this.per = 1
      } else {
        this.per = this.maxAmplitude / 30000
      }
    })
  }

  build() {
    Row({ space: 5 }) {
      ForEach(Array.from({ length: 30 }), () => {
        Column()
          .layoutWeight(1)
          .height(this.per * 100 * Math.random())
          .backgroundColor($r('app.color.common_blue'))
      })
    }
    .width('100%')
    .height(100)
    .backgroundColor($r('app.color.common_gray_bg'))
  }
}