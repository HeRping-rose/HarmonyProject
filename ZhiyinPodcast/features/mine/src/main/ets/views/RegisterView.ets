// import { TextInput, Button, Text, Column, Row, Divider, Toggle, Image } from '@kit.ArkTS';
import { userRegAPI } from '../api/login';
import { promptAction } from '@kit.ArkUI';

@ComponentV2
export  struct RegisterView {
  @Local username: string = '';
  @Local email: string = '';
  @Local password: string = '';
  @Local confirmPassword: string = '';
  @Local agreeToTerms: boolean = false;
  @Local showPassword: boolean = false;
  @Local showConfirmPassword: boolean = false;

  // 处理注册逻辑
  private handleRegister() {
    if (!this.validateInput()) {
      return;
    }

    // 执行注册逻辑
    console.log('注册信息:', {
      username: this.username,
      password: this.password,
      confirmPassword: this.confirmPassword
    });

    // 这里可以调用注册API
    let res =userRegAPI({
      username: this.username,
      password: this.password,
      confirmPassword: this.confirmPassword
    })
    promptAction.openToast({message:JSON.stringify(res)})
  }

  // 验证输入信息
  private validateInput(): boolean {
    if (this.username.trim().length === 0) {
      console.error('用户名不能为空');
      return false;
    }

    if (this.email.trim().length === 0 || !this.isValidEmail(this.email)) {
      console.error('请输入有效的邮箱地址');
      return false;
    }

    if (this.password.length < 6) {
      console.error('密码长度不能少于6位');
      return false;
    }

    if (this.password !== this.confirmPassword) {
      console.error('两次输入的密码不一致');
      return false;
    }

    if (!this.agreeToTerms) {
      console.error('请同意用户协议和隐私政策');
      return false;
    }

    return true;
  }

  // 验证邮箱格式
  private isValidEmail(email: string): boolean {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  // 跳转到登录页面
  private navigateToLogin() {
    // 这里可以实现页面跳转逻辑
    console.log('跳转到登录页面');
  }

  build() {
    Scroll() {
      Column({ space: 24 }) {
        // 标题
        Text('用户注册')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 40 })

        // 用户名输入
        Column() {
          Text('用户名')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          TextInput({
            placeholder: '请输入用户名',
            text: this.username
          })
            .onChange((value: string) => {
              this.username = value;
            })
            .width('100%')
            .height(48)
            .borderRadius(8)
            .margin({ top: 8 })
        }
        .width('90%')

        // 邮箱输入
        // Column() {
        //   Text('邮箱')
        //     .fontSize(14)
        //     .fontWeight(FontWeight.Medium)
        //     .alignSelf(Alignment.Start)
        //
        //   TextInput({
        //     placeholder: '请输入邮箱地址',
        //     text: this.email
        //   })
        //     .onChange((value: string) => {
        //       this.email = value;
        //     })
        //     .width('100%')
        //     .height(48)
        //     .borderRadius(8)
        //     .margin({ top: 8 })
        // }
        // .width('90%')

        // 密码输入
        Column() {
          Text('密码')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Row() {
            TextInput({
              placeholder: '请输入密码',
              text: this.password,
              // secure: !this.showPassword
            })
              .onChange((value: string) => {
                this.password = value;
              })
              .width('90%')
              .height(48)
              .borderRadius(8)

            // Image(this.showPassword ? $r('app.media.eye_open') : $r('app.media.eye_close'))
            //   .width(24)
            //   .height(24)
            //   .margin({ start: 8 })
            //   .onClick(() => {
            //     this.showPassword = !this.showPassword;
            //   })
          }
          .margin({ top: 8 })
        }
        .width('90%')

        // 确认密码输入
        Column() {
          Text('确认密码')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)

          Row() {
            TextInput({
              placeholder: '请再次输入密码',
              text: this.confirmPassword,
              // secure: !this.showConfirmPassword
            })
              .onChange((value: string) => {
                this.confirmPassword = value;
              })
              .width('90%')
              .height(48)
              .borderRadius(8)

            // Image(this.showConfirmPassword ? $r('app.media.eye_open') : $r('app.media.eye_close'))
            //   .width(24)
            //   .height(24)
            //   .margin({ start: 8 })
            //   .onClick(() => {
            //     this.showConfirmPassword = !this.showConfirmPassword;
            //   })
          }
          .margin({ top: 8 })
        }
        .width('90%')

        // 用户协议复选框
        Row({ space: 8 }) {
          Toggle({ type: ToggleType.Checkbox, isOn: this.agreeToTerms })
            .onChange((isOn: boolean) => {
              this.agreeToTerms = isOn;
            })

          Text('我已阅读并同意')
            .fontSize(14)

          Text('《用户协议》')
            .fontSize(14)
            .fontColor('#007DFF')
            .onClick(() => {
              // 跳转到用户协议页面
            })

          Text('和')
            .fontSize(14)

          Text('《隐私政策》')
            .fontSize(14)
            .fontColor('#007DFF')
            .onClick(() => {
              // 跳转到隐私政策页面
            })
        }
        .width('90%')
        .alignItems(VerticalAlign.Center)

        // 注册按钮
        Button('注册', {
          type: ButtonType.Capsule,
          // state: this.isRegisterButtonEnabled() ? ButtonState.Normal : ButtonState.Disabled
        })
          .width('90%')
          .height(48)
          .borderRadius(24)
          .backgroundColor(this.isRegisterButtonEnabled() ? '#007DFF' : '#CCCCCC')
          .fontColor('#FFFFFF')
          .onClick(() => {
            this.handleRegister();
          })

        // 登录跳转
        Row() {
          Text('已有账户？')
            .fontSize(14)

          Text('立即登录')
            .fontSize(14)
            .fontColor('#007DFF')
            .onClick(() => {
              this.navigateToLogin();
            })
        }
        .margin({ top: 16, bottom: 40 })

        Blank()
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
  }

  // 判断注册按钮是否可点击
  private isRegisterButtonEnabled(): boolean {
    return this.username.length > 0 &&
      this.email.length > 0 &&
      this.password.length >= 6 &&
      this.confirmPassword.length > 0 &&
      this.password === this.confirmPassword;
  }
}
