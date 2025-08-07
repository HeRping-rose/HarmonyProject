import { appTasks } from '@ohos/hvigor-ohos-plugin';
import { appPlugin } from "@hadss/hmrouter-plugin";/*使用路由编译插件 插件配置*/
export default {
  system: appTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [
    // appPlugin({ ignoreModuleNames: [/** 不需要扫描的模块 **/] })
  ]       /* Custom plugin to extend the functionality of Hvigor. */
}