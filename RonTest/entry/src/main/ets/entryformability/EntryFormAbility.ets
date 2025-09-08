import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';

export default class EntryFormAbility extends FormExtensionAbility {
  // 卡片刚创建时触发
  onAddForm(want: Want) {
    // Called to return a FormBindingData object.
    class FormData {
      // 每一张卡片创建时都会被分配一个唯一的id
      formId: string = want.parameters!['ohos.extra.param.key.form_identity'].toString();
      abc:string='123'
    }

    // const formData = '';
    let formData = new FormData();
    //只能放一个对象
    // let formData: FormDataParam = {
    //   // formId: formData.formId,
    //   data: '123',
    //
    // };
    //并不是直接发给页面 ,他会把数据自动的存到localstorage中
    return formBindingData.createFormBindingData(formData);
  }

  // 卡片转化为常态卡片时触发
  onCastToNormalForm(formId: string) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  // 卡片被更新时触发 (调用updateFrom时)
  onUpdateForm(formId: string) {
    // Called to notify the form provider to update a specified form.
  }

  // 卡片发起特定事件时触发(msg)
  onFormEvent(formId: string, message: string) {
    // Called when a specified message event defined by the form provider is triggered.
    // // message {"num":100,"aa":200,"params":{"num":100,"aa":200},"action":"message"}
    //不能打console.log()
    console.log(message)
    //学习如何接收postCardAction发来的数据
    interface IData {
      num: number
      aa: number
    }

    interface IRes extends IData {
      params: IData,
      action: "message"
      formId: string
    }

    const params = JSON.parse(message) as IRes
    // console.log( JSON.stringify( params))

    // 返回数据给对应的卡片 收到数据之后去更新卡片视图
    // 4.数据对象格式
    interface IRet {
      num: number
    }

    // 3.规定为一个对象格式进行传入
    const data: IRet = {
      num: params.num + 100
    }

    // 2.是这个数据类型formBindingData.createFormBindingData()
    const formInfo = formBindingData.createFormBindingData(data)
    // 返回数据给对应的卡片
    // 1.formProvider提供者提供了updateForm方法去更新卡片
    // 参数1 表示卡片的id 参数2传入的内容 要符合数据格式 存到localstorage中
    formProvider.updateForm(params.formId, formInfo)
  }

  // 卡片被卸载时候触发
  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  // 卡片状态发生改变时触发
  onAcquireFormState(want: Want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }


  //以下几个以供了解
  //onChangeFormVisibility 卡片可见性修改时触发
  onChangeFormVisibility(): void {
    // Called when the visibility of the form is changed.
  }

  // 系统配置更新时触发
  onConfigurationUpdate(): void {
    // Called when the configuration of the form provider is updated.
  }

  // 卡片进程退出时触发
  onStop(): void {

  }
}

interface FormDataParam {
  // formId: string;
  data: string
}
