import { hapTasks } from '@ohos/hvigor-ohos-plugin';
import { hapPlugin } from "@hadss/hmrouter-plugin";


export default {
  system: hapTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [
    //配置插件 希望在当前包中使用插件
    hapPlugin()
  ]       /* Custom plugin to extend the functionality of Hvigor. */
}