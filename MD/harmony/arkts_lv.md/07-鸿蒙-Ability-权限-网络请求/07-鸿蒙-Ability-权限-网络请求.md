# 7. UIAbility 组件

每一个UIAbility实例，都对应于一个最近任务列表中的任务。

UIAbility是一种包含用户界面的应用组件，主要用于和用户进行交互。UIAbility也是系统调度的单元，为应用提供窗口在其中绘制界面。

![img](.\img\1708677132666-aa651179-9ee2-45a8-a2d9-5e39ea36bdbf.png)

一个应用可以有一个 UIAbility也可以有多个UIAbility，如图所示：

- 单 UIAbility：任务列表只有一个任务，应用内部结合【多页面】的形式让用户进行的搜索和浏览内容，页面的跳转使用路由来实现即可（到目前为止咱们做的都是这种）
- 多个 UIAbility：那么在任务列表中会有多个任务。比如图片中聊天应用增加一个“外卖功能”的场景，则可以将聊天应用中“外卖功能”的内容独立为一个UIAbility，当用户打开聊天应用的“外卖功能”，查看外卖订单详情，此时有新的聊天消息，即可以通过最近任务列表切换回到聊天窗口继续进行聊天对话。

## 7.1. 指定 UIAbility 的启动页面

在UIAbility的onWindowStageCreate()生命周期回调中，通过 WindowStage 对象的 loadContent() 方法设置启动页面。

**TIP**

- **如果应用启动出现白屏，可能是加载的页面设置出现问题**
- **设置的页面，需要在** **main_page.json5****中存在，且同名**

![img](.\img\1708678958520-880ae430-e0b5-4f91-9f7e-79d2244cc541.png)

```typescript
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    windowStage.loadContent('pages/Index', (err, data) => {
      // ...
    });
  }

  // ...
}
```

**注意：**

1.  windowStage.loadContent加载的页面，不可以用 / 开头
2. 加载的页面需要在 **main_pages.json5** 中存在
3. 出现页面白色的（上述 2 个问题）



## 7.2. UIAbility 组件的生命周期

当用户打开、切换和返回到对应应用时，应用中的UIAbility实例会在其生命周期的不同状态之间转换。UIAbility类提供了一系列【回调函数】，如果需要在特定的时间添加自定义逻辑，往对应的回调函数内添加代码即可



UIAbility的生命周期包括Create、Foreground、Background、Destroy四个状态，如下图所示。

![img](.\img\1708679973587-de77fbfe-2a46-4d6a-9012-2284e42fc746.png)

- **onCreate**:Ability创建时回调，执行初始化业务逻辑操作。
- **onDestory**:Ability生命周期回调，在销毁时回调，执行资源清理等操作。
- **onWindowStageCreate**:当WindowStage创建后调用。
- **onWindowStageDestory**:当WindowStage销毁后调用。
- **onForeground**:Ability生命周期回调，当应用从后台转到前台时触发。
- **onBackground**:Ability生命周期回调，当应用从前台转到后台时触发

可以根据下图的方式观察到状态改变时触发的回调函数函数：

 **注：**

- 3 下方划横线的内容需要手动输入

![img](.\img\1708680392229-1e2059b2-9967-4511-8de7-c4afc7275d58.png)



## 7.3. UIAbility 组件间交互

UIAbility是【系统调度】的最小单元。在设备内的功能模块之间跳转时，会涉及到启动特定的UIAbility，咱们来看看如何实现。【注：咱们目前专注于启动应用内的 UIAbility 即可】

![img](.\img\1712268284073-a9206cf2-08c5-46c0-b013-e12fd026e42d.png)

多个 **Ability** 的应用

![img](.\img\1712288744688-5b88e3b8-5d51-48c3-9b73-66117b0800be.png)

### 7.3.1. 创建多个 Ability

首先在项目中创建多个 Ability

![img](.\img\1708681977225-a49e3fce-5bb3-45b4-8f52-2e52418f8329.png)

![img](.\img\1708682053056-6b08f6ac-b313-4353-a3d1-36c312863a67.png)

创建完毕之后项目会发生如下改变:

![img](.\img\1708682744236-d3e18bea-f1f8-4927-8674-04820e5714d2.png)



### 7.3.2. 如何设置默认启动的 Ability

如果希望刚刚创建的Ability 作为默认启动的 Ability 可以通过如下方式进行设置：

1. 调整配置：

1. 配置中增加：exported 和 skills ，并移除默认Ability 中对应的配置

1. 调整顺序：

1. 如果多个 Ability 中都设置了exported 和 skills ，那么调整他们在 abilities 数组中的顺序即可，排名靠前的先启动

```json
{
  "module": {
    // ....
    "abilities": [
      // 默认的 Ability
      {
        "name": "EntryAbility",
        "srcEntry": "./ets/entryability/EntryAbility.ets",
        "description": "$string:EntryAbility_desc",
        "icon": "$media:icon",
        "label": "$string:EntryAbility_label",
        "startWindowIcon": "$media:startIcon",
        "startWindowBackground": "$color:start_window_background",
      },
      {
        "name": "SecondAbility",
        "srcEntry": "./ets/secondability/SecondAbility.ets",
        "description": "$string:SecondAbility_desc",
        "icon": "$media:icon",
        "label": "$string:SecondAbility_label",
        "startWindowIcon": "$media:startIcon",
        "startWindowBackground": "$color:start_window_background",
        "exported": true,
        "skills": [
          {
            "entities": [
              "entity.system.home"
            ],
            "actions": [
              "action.system.home"
            ]
          }
        ]
      }
    ],
    "requestPermissions": [
      {
        "name": "ohos.permission.INTERNET",
        "usedScene": {
          "abilities": [
            "FormAbility"
          ],
          "when": "inuse"
        }
      }
    ],
    "extensionAbilities": [

    ]
  }
}
```



### 7.3.3. 启动 UIAbility

刚刚演示的是设置默认启动的 UIAbility，接下来演示如何在应用逻辑中，通过【代码启动】

启动 UIAbility 的话，咱们分为 2 种情况：

1. 启动同一个模块中的其他 UIAbility(目前代码的情况)
2. 启动不同模块中的 UIAbility



#### 7.3.3.1. 同一个模块中的 UIAbility

同一个模块中的UIAbility跳转

![img](.\img\1712270117920-116a56c7-0427-4a10-8b7f-4b6170dc4f95.png)

这部分代码能够 **C+V** 并且【调整】为需要的值即可：

1. 准备 want 作为 UIAbility 的启动入口参数，然后设置对应的属性值
2. 通过 this.context获取当前 UIAbility 的【上下文对象】，然后调用 startAbility 并传入 want 即可实现启动

上下文对象：其提供了应用的一些【基础信息】和一些可以【调用的方法】



**试一试：**

1. 从上一步【 添加的Abilty】 跳转到【默认的 Ability】

```arkts
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct SecondAbilityPage {
  @State message: string = 'Hello World';
  //1. 获取上下文对象(后续直接使用)
  //context = getContext(this) as common.UIAbilityContext;
  context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            //2. 准备 want类型的对象并设置属性
            let wantInfo: Want = {
              deviceId: '', // deviceId为空表示本设备
              bundleName: 'com.itcast.myapplication', // AppScope/app.json5确认
              moduleName: 'entry', // moduleName非必选
              abilityName: 'EntryAbility', //  src/main/module.json5确认
              parameters: {
                // 自定义信息
                info: '来自EntryAbility Page_UIAbilityComponentsInteractive页面'
              },
            }
            //3. 通过上下文对象拉起对应的 Abilit
            this.context.startAbility(wantInfo)
              .then(() => {
                console.log('startAbility success.');
              })
              .catch((error: BusinessError) => {
                console.log('startAbility failed.');
              });
          })
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}
```



# 7. 网络管理（需要模拟器）

## 7.4. 应用权限

ATM (AccessTokenManager) 是HarmonyOS上基于AccessToken构建的统一的应用权限管理能力

应用权限保护的对象可以分为数据和功能：

- 数据包含了个人数据（如照片、通讯录、日历、位置等）、设备数据（如设备标识、相机、麦克风等）、应用数据。
- 功能则包括了设备功能（如打电话、发短信、联网等）、应用功能（如弹出悬浮框、创建快捷方式等）等。

根据授权方式的不同，权限类型可分为system_grant（系统授权）和user_grant（用户授权）。

- 配置文件权限声明
- 向用户申请授权



**例如：访问网络需要联网权限**

system_grant（系统授权）配置后直接生效

![img](.\img\1701346958161-2d8aed0c-6898-4888-9b1f-0dfaaef83371.png)



```json
{
  "module" : {
    // ...
    "requestPermissions":[
      {
        "name" : "ohos.permission.INTERNET"
      }
    ]
  }
}
```



**例如：获取地址位置权限**

user_grant（用户授权）向用户申请

![img](.\img\1716021559214-9f81570f-059e-4c6a-a971-4ed2b1423119.png)

1.首先在module.json5中配置权限申请地址位置权限

```json
{
  "module" : {
    // ...
    "requestPermissions":[
      {
        "name" : "ohos.permission.INTERNET"
      }，
      {
        "name": "ohos.permission.APPROXIMATELY_LOCATION",
        "reason": "$string:permission_location",
        "usedScene": {
          "abilities": ["EntryAbility"],
          "when": "always"
        }
      }
    ]
  }
}
```

2.在ability中申请用户授权

![img](.\img\1711704136130-f4ef22db-0077-4f8b-bfad-0466a4148fcb.png)

通过abilityAccessCtrl创建管理器进行申请权限

```json
Button('向用户申请权限')
  .onClick(async () => {
    const manager = abilityAccessCtrl.createAtManager() // 创建程序控制管理器
    await manager.requestPermissionsFromUser(getContext(),
      [
        "ohos.permission.APPROXIMATELY_LOCATION"
      ])
  })
```

开启权限后可以获取经纬度坐标

![img](.\img\1716021717557-d987faa1-8b9a-4935-b995-964377cde2df.png)

```json
import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { geoLocationManager } from '@kit.LocationKit';

@Entry
@ComponentV2
struct Network {
  @Local result: geoLocationManager.Location = {} as geoLocationManager.Location
  build() {
    Column() {
      // 需要配置网络权限
      Image('https://img0.baidu.com/it/u=2746250950,140672823&fm=253&fmt=auto&app=138&f=JPEG?w=536&h=500')
        .width(100)
      Button('向用户申请权限')
        .onClick(async () => {
          const manager = abilityAccessCtrl.createAtManager() // 创建程序控制管理器
          await manager.requestPermissionsFromUser(getContext(),
            [
              "ohos.permission.APPROXIMATELY_LOCATION"
            ])
        })
      Button(`经纬度:${this.result.latitude}, ${this.result.longitude}`)
      Button('获取经纬度').onClick(async () => {
        this.result = await geoLocationManager.getCurrentLocation()
      })
      Button('二次申请权限').onClick(() => {
        const atManager = abilityAccessCtrl.createAtManager()
        atManager.requestPermissionOnSetting(getContext(),
          [
            "ohos.permission.APPROXIMATELY_LOCATION"
          ]
        )
      })
      Button('跳转到系统设置页').onClick(() => {
        (getContext() as common.UIAbilityContext).startAbility({
          deviceId: '', // 本设备
          bundleName: 'com.huawei.hmos.settings', // 包名
          abilityName: 'com.huawei.hmos.settings.MainAbility', // Ability窗口
          uri: 'application_info_entry',
          parameters: {
            pushParams: 'com.example.online08demo'
          }
        })
      })
    }
  }
}
```



## 7.4.2. HTTP请求（需要模拟器）

## request接口开发步骤

1. **从@ohos.net.http.d.ts中导入http命名空间**。
2. **调用createHttp()方法，创建一个HttpRequest对象**。
3. 调用该对象的on()方法，订阅http响应头事件，此接口会比request请求先返回。可以根据业务需要订阅此消息。
4. **调用该对象的request()方法，传入http请求的url地址和可选参数，发起网络请求**。
5. 按照实际业务需要，解析返回结果。
6. 调用该对象的off()方法，取消订阅http响应头事件。
7. 当该请求使用完毕时，调用destroy()方法主动销毁。

```typescript
// 引入包名
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

// 每一个httpRequest对应一个HTTP请求任务，不可复用
let httpRequest = http.createHttp();
// 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
// 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
httpRequest.on('headersReceive', (header) => {
  console.info('header: ' + JSON.stringify(header));
});
httpRequest.request(
  // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
  "EXAMPLE_URL",
  {
    method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
    // 开发者根据自身业务需要添加header字段
    header: [{
      'Content-Type': 'application/json'
    }],
    // 当使用POST请求时此字段用于传递内容
    extraData: "data to send",
    expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
    usingCache: true, // 可选，默认为true
    priority: 1, // 可选，默认为1
    connectTimeout: 60000, // 可选，默认为60000ms
    readTimeout: 60000, // 可选，默认为60000ms
    usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
    usingProxy: false, // 可选，默认不使用网络代理，自API 10开始支持该属性
    caPath:'/path/to/cacert.pem', // 可选，默认使用系统预制证书，自API 10开始支持该属性
    clientCert: { // 可选，默认不使用客户端证书，自API 11开始支持该属性
      certPath: '/path/to/client.pem', // 默认不使用客户端证书，自API 11开始支持该属性
      keyPath: '/path/to/client.key', // 若证书包含Key信息，传入空字符串，自API 11开始支持该属性
      certType: http.CertType.PEM, // 可选，默认使用PEM，自API 11开始支持该属性
      keyPassword: "passwordToKey" // 可选，输入key文件的密码，自API 11开始支持该属性
    },
    multiFormDataList: [ // 可选，仅当Header中，'content-Type'为'multipart/form-data'时生效，自API 11开始支持该属性
      {
        name: "Part1", // 数据名，自API 11开始支持该属性
        contentType: 'text/plain', // 数据类型，自API 11开始支持该属性
        data: 'Example data', // 可选，数据内容，自API 11开始支持该属性
        remoteFileName: 'example.txt' // 可选，自API 11开始支持该属性
      }, {
        name: "Part2", // 数据名，自API 11开始支持该属性
        contentType: 'text/plain', // 数据类型，自API 11开始支持该属性
        // data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt
        filePath: `${getContext(this).filesDir}/fileName.txt`, // 可选，传入文件路径，自API 11开始支持该属性
        remoteFileName: 'fileName.txt' // 可选，自API 11开始支持该属性
      }
    ]
  }, (err: BusinessError, data: http.HttpResponse) => {
    if (!err) {
      // data.result为HTTP响应内容，可根据业务需要进行解析
      console.info('Result:' + JSON.stringify(data.result));
      console.info('code:' + JSON.stringify(data.responseCode));
      // data.header为HTTP响应头，可根据业务需要进行解析
      console.info('header:' + JSON.stringify(data.header));
      console.info('cookies:' + JSON.stringify(data.cookies)); // 8+
      // 当该请求使用完毕时，调用destroy方法主动销毁
      httpRequest.destroy();
    } else {
      console.error('error:' + JSON.stringify(err));
      // 取消订阅HTTP响应头事件
      httpRequest.off('headersReceive');
      // 当该请求使用完毕时，调用destroy方法主动销毁
      httpRequest.destroy();
    }
  }
);
```

测试接口地址： https://zhousg.atomgit.net/harmonyos-next/takeaway.json

2）使用 `@ohos.net.http` 模块发请求

```typescript
import { http } from '@kit.NetworkKit'

@Entry
@Component
struct D3HTTPCase {
  async sendHttp() {
    // 创建实例
    const instance = http.createHttp()
    // 通过实例, 发起请求连接
    const res = await instance.request('https://zhousg.atomgit.net/harmonyos-next/takeaway.json')
    AlertDialog.show({
      message: res.result as string
    })
  }
  build() {
    Column() {
      Button('发送http请求').onClick(() => {
        this.sendHttp()
      })
    }
  }
}
```

![img](.\img\1702210757454-3eb4199a-e6d3-4d50-bf2f-e131c0027129.png)



## 7.4.3. 案例-开心一笑



![img](.\img\1712508956261-1539184e-a744-4b55-8ae7-8a512cf60d24.png)

接下来完成一个案例，需求：默认获取若干条笑话，并渲染到页面上

```arkts
@Entry
@ComponentV2
struct Day04_Jokes {
  @Local jokes: string [] = ['笑话 1']
  jokeNum: number = 5

  build() {
    Column() {
      // 顶部
      this.HeaderBuilder()
      // 笑话列表
      List({ space: 10 }) {
        ForEach(this.jokes, (joke: string) => {
          ListItem() {
            Column({ space: 10 }) {
              Text('笑话标题')
                .fontSize(20)
                .fontWeight(600)
              Row({ space: 15 }) {
                titleIcon({ icon: $r('app.media.ic_public_time'), info: '2024-1-1' })
                titleIcon({ icon: $r('app.media.ic_public_read'), info: '阅读(6666)' })
                titleIcon({ icon: $r('app.media.ic_public_comments'), info: '评论(123)' })
              }

              Text(joke)
                .fontSize(15)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(20)

          }
          .borderRadius(10)
          .backgroundColor(Color.White)
          .shadow({ radius: 2, color: Color.Gray })
        })

      }
      .padding(10)
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(25);

      Image($r('app.media.ic_public_joke_logo'))
        .width(30)

      Image($r('app.media.ic_public_search'))
        .width(30);
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }
}

@Component
struct titleIcon {
  icon: ResourceStr = ''
  info: string = ''

  build() {
    Row() {
      Image(this.icon)
        .width(15)
        .fillColor(Color.Gray)
      Text(this.info)
        .fontSize(14)
        .fontColor(Color.Gray)
    }
  }
}
```

**获取若干条笑话：**

**接口地址：**[**https://api-vue-base.itheima.net/api/joke/list?num=10**](https://api-vue-base.itheima.net/api/joke/list?num=10)

**核心步骤:**

1. 生命周期函数中获取数据 

1. aboutToAppear
2. http 模块获取笑话，若干条

1. 将获取到的数据转换格式并渲染

1. JSON.parse as 类型

```arkts
import { http } from '@kit.NetworkKit'

interface JokeResponse {
  msg: string
  code: number
  data: string[]
}

@Entry
@ComponentV2
struct Day04_Jokes {
  @Local jokes: string [] = ['笑话 1']
  jokeNum: number = 5

  async getJokes() {
    const req = http.createHttp()
    const res = await req.request(`https://api-vue-base.itheima.net/api/joke/list?num=${this.jokeNum}`)
    const jokeRes = JSON.parse(res.result.toString()) as JokeResponse
    this.jokes = jokeRes.data
  }

  async aboutToAppear() {
    this.getJokes()
  }

  build() {
    Column() {
      // 顶部
      this.HeaderBuilder()
      // 笑话列表
      List({ space: 10 }) {
        ForEach(this.jokes, (joke: string) => {
          ListItem() {
            Column({ space: 10 }) {
              Text(joke.slice(0, 10) + '...')
                .fontSize(20)
                .fontWeight(600)
              Row({ space: 15 }) {
                titleIcon({ icon: $r('app.media.ic_public_time'), info: '2024-1-1' })
                titleIcon({ icon: $r('app.media.ic_public_read'), info: '阅读(6666)' })
                titleIcon({ icon: $r('app.media.ic_public_comments'), info: '评论(123)' })
              }

              Text(joke)
                .fontSize(15)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(20)

          }
          .borderRadius(10)
          .backgroundColor(Color.White)
          .shadow({ radius: 2, color: Color.Gray })
        })

      }
      .padding(10)
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(25);

      Image($r('app.media.ic_public_joke_logo'))
        .width(30)

      Image($r('app.media.ic_public_search'))
        .width(30);
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }
}

@Component
struct titleIcon {
  icon: ResourceStr = ''
  info: string = ''

  build() {
    Row() {
      Image(this.icon)
        .width(15)
        .fillColor(Color.Gray)
      Text(this.info)
        .fontSize(14)
        .fontColor(Color.Gray)
    }
  }
}
```

易错点：

1. JSON.parse(res.result.toString()) as 类型 （类型的属性名，必须和返回的值一样）
2. 查询参数的传递格式有要求：url 地址?xxx=xxx
3. 字符串方法 

1. slice,传入索引返回一个切割之后的【字符串】,
2. split,根据传入的内容将字符串切割为【字符串】数





## 7.4.4. axios-发送请求

使用第三方包 axios

[openharmony中心仓地址](https://ohpm.openharmony.cn/#/cn/home)

- 安装axios

```bash
$  ohpm install @ohos/axios
```

- 发起请求

```typescript
import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct HttpCase {
  @Local message: string = 'Hello World';

  async getData() {
    const result = await axios.get<object, AxiosResponse<object,null>>("https://zhousg.atomgit.net/harmonyos-next/takeaway.json")
    promptAction.showToast({ message: JSON.stringify(result) })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("测试请求")
          .onClick(() => {
            this.getData()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
interface Data {
  name: string
}
```

![img](.\img\1710562181504-0d4435a6-bc31-4264-998a-1f4f6aa86343.png)



## 7.5. axios-实现开心一笑

```ts
import axios, { AxiosResponse } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'
import { JokeResponse } from './models/Jokes'

@Entry
@ComponentV2
struct Day05_Jokes {
  @Local jokes: string [] = ['笑话 1']
  jokeNum: number = 5

  async getJokes() {
    const res = await axios.get<object, AxiosResponse<JokeResponse,null>>(`https://api-vue-base.itheima.net/api/joke/list?num=${this.jokeNum}`)
    this.jokes = res.data.data
    // promptAction.showDialog({
    //   message: JSON.stringify(res.data)
    // })
  }

  async aboutToAppear() {
    this.getJokes()
  }

  build() {
    Column() {
      // 顶部
      this.HeaderBuilder()
      // 笑话列表
      List({ space: 10 }) {
        ForEach(this.jokes, (joke: string) => {
          ListItem() {
            Column({ space: 10 }) {
              Text(joke.slice(0, 10) + '...')
                .fontSize(20)
                .fontWeight(600)
              Row({ space: 15 }) {
                titleIcon({ icon: $r('app.media.ic_public_time'), info: '2024-1-1' })
                titleIcon({ icon: $r('app.media.ic_public_read'), info: '阅读(6666)' })
                titleIcon({ icon: $r('app.media.ic_public_comments'), info: '评论(123)' })
              }

              Text(joke)
                .fontSize(15)
                .fontColor(Color.Gray)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(20)

          }
          .borderRadius(10)
          .backgroundColor(Color.White)
          .shadow({ radius: 2, color: Color.Gray })
        })

      }
      .padding(10)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }

  @Builder
  HeaderBuilder() {
    Row() {
      Image($r('app.media.ic_public_drawer_filled'))
        .width(25);

      Image($r('app.media.ic_public_joke_logo'))
        .width(30)

      Image($r('app.media.ic_public_search'))
        .width(30);
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .padding(10)
    .border({ width: { bottom: 2 }, color: '#f0f0f0' })
    .backgroundColor(Color.White)
  }
}

@Component
struct titleIcon {
  icon: ResourceStr = ''
  info: string = ''

  build() {
    Row() {
      Image(this.icon)
        .width(15)
        .fillColor(Color.Gray)
      Text(this.info)
        .fontSize(14)
        .fontColor(Color.Gray)
    }
  }
}
```

