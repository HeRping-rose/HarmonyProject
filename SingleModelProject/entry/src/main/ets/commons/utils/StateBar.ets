import { AppStorageV2, window } from '@kit.ArkUI'
import { savedContext } from '../../models'

class StateBar{


  async light(){
    let context = AppStorageV2.connect(savedContext)!.context
    let win = await window.getLastWindow(context)
    await win.setWindowSystemBarProperties({
      statusBarContentColor: '#ffbfaaaa'
    })
  }

  async dark(){
    let context = AppStorageV2.connect(savedContext)!.context
    let win = await window.getLastWindow(context)
    await win.setWindowSystemBarProperties({
      statusBarContentColor: '#ff80bbbf'
    })

  }
}
export const stateBar = new StateBar()