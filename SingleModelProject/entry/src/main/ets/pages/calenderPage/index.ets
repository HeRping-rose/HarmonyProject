import { HcNavBar } from "../../commons/components/HcNavBar"
import { HmCalendar, HmCalendarSelectedDay } from '@ohmos/calendar'
import { httpClient } from "../../commons/utils/httpClient"
import { ClockInParams, ClockInRes } from "../../models"
import { promptAction } from "@kit.ArkUI"


interface DayBuilderParams {
  day: number
  text: string
}


@ComponentV2
struct calenderPage {
  @Local clockinfo:ClockInRes={flag:false,clockinNumbers:0,totalClockinNumber:0,clockins:[]}
  @Local ClockIns:HmCalendarSelectedDay[]=[]
  async getClockIn(year:string,month:string){

    let res=await httpClient.request<ClockInRes,ClockInParams>({
      url:'clockinInfo',
      method:'get',
      params:{month:month,year:year} as ClockInParams
    })
    console.log(JSON.stringify(res))
    this.clockinfo=res
    this.ClockIns=res.clockins.map(i=> ({ date:i.createdAt}) as HmCalendarSelectedDay)
  }

  aboutToAppear(): void {
    let now = new Date()
    let year = (now.getFullYear()).toString()
    let month = (now.getMonth() + 1).toString()
    this.getClockIn(year, month)
  }
  @Builder
  dayBuilder(params: DayBuilderParams) {
    Column() {
      Row() {
        Text(params.day.toString())
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
        Text('天')
          .fontSize(10)
          .fontColor($r('app.color.common_gray_01'))
          .margin({ bottom: 8, left: 10 })
      }
      .alignItems(VerticalAlign.Bottom)

      Text(params.text)
        .fontSize(10)
        .fontColor($r('app.color.common_gray_01'))
    }.margin({ right: 36 })
  }

  build() {
    //必须用NavDestination包裹
    NavDestination() {
      Column({ space: 16 }) {
        HcNavBar({ title: '每日打卡', showRightIcon: false })
        Row() {
          this.dayBuilder({ day: this.clockinfo.totalClockinNumber, text: '累计打卡' })
          this.dayBuilder({ day: this.clockinfo.clockinNumbers, text: '连续打卡' })
        }
        .padding({
          top: 10,
          bottom: 25,
          left: 16,
          right: 16
        })
        .width('100%')
        .justifyContent(FlexAlign.Start)

        Row() {
          Row(){
            HmCalendar({
              color: '#ffe9914e',
              // selectedDays: [
              //   { date: '2025-07-23' },
              //   { date: '2025-07-24' },
              //   { date: '2025-07-25' },
              // ]
              selectedDays:this.ClockIns,
              onChangeMonth:(date:string)=>{
                //提示
                promptAction.openToast({message:date})
                let year:string=date.split('-')[0]
                let month:string=date.split('-')[1]
                this.getClockIn(year,month)
              }

            })
              .borderRadius(8)
              .border({ width: 0.5, color: '#ededed' })
              .shadow({ color: '#ededed', radius: 16 })

          }
            .width('100%')
            .height(350)
            .borderRadius(8)
            .border({ width: 0.5, color: '#ededed' })
            .shadow({ color: '#ededed', radius: 16 })
            .backgroundColor($r('app.color.white'))
        }
        .padding({ left: 16, right: 16 })
      }
      .width('100%')
      .height('100%')
      .backgroundImage($r('app.media.clocked_bg'))
      .backgroundImageSize({ width: '100%' })
    }
    .hideTitleBar(true)
  }

}

@Builder
function calenderPageBuilder(){
  calenderPage()
}

export { calenderPageBuilder }
