import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import { commonEvent } from '../utils/CommonEventManager';

export default class EntryFormAbility extends FormExtensionAbility {
  // 当卡片被拖动到桌面时，桌面会调用该方法，该方法返回一个FormBindingData对象，用于创建卡片。
  // 刚刚创建卡片时调用
  onAddForm(want: Want) {
    let formId:string=want.parameters![formInfo.FormParam.IDENTITY_KEY] as string
    //订阅 公共事件 实时保持监听 把要订阅的(执行的函数放到内存中当有人发布时就可以立即触发)
    commonEvent.subscribe('updateCard', (data) => {
      // 创建一个卡片的数据  然后去更新卡片组件的数据formProvider.updateForm()
      //formId: string, formBindingData: formBindingData.FormBindingData, callback: AsyncCallback<void, void>
      // formBindingData:要传入的数据
      formProvider.updateForm(
        formId,
        formBindingData.createFormBindingData({
          content:data  //存到本地数据库中  以key:value形式存入
        }),

      )
    })


    // Called to return a FormBindingData object.
    // 通过刚刚创建好的卡片时就立即给 卡片组件发送数据
    // 这个数据的格式是createFormBindingData的数据格式
    // 因为这个数据会自动存到 localstorage中 看不见过程(不可持久化)
    const formData = '';
    return formBindingData.createFormBindingData(formData);
    //订阅
  }

  onCastToNormalForm(formId: string) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId: string) {
    // Called to notify the form provider to update a specified form.
  }

  onFormEvent(formId: string, message: string) {
    // Called when a specified message event defined by the form provider is triggered.
  }

  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onAcquireFormState(want: Want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
}