import { hilog } from '@kit.PerformanceAnalysisKit'
import { logger } from '../../commons/utils'

@Entry
@Component
struct Test01 {

  build() {
    Column({space:10}){
      Button('打印信息debug').onClick(() => {
        hilog.debug(0x1111, 'os', '%{public}s %{public}d', '小明', 20)
      })
      Button('打印信息info').onClick(() => {
        hilog.info(0x1111, 'os', '%{public}s %{public}d', '小明', 20)
      })
      Button('打印信息warn').onClick(() => {
        hilog.warn(0x1111, 'os', '%{public}s %{public}d', '小明', 20)
      })
      Button('打印信息error').onClick(() => {
        hilog.error(0x1111, 'os', '%{public}s %{public}d', '小明', 20)
      })
      Button('打印信息fatal').onClick(() => {
        hilog.fatal(0x1111, 'os', '%{public}s %{public}d', '小明', 20)
      })
      Button('自定义Log').onClick(() => {
        logger.info('自定义', 'loggerInfo')
        logger.warn('自定义', 'loggerWarn')
      })

    }
    .width('100%')

  }
}