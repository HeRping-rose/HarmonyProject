import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { App, AppStorageV2 } from '@kit.ArkUI';
import { savedContext } from '../../models';



// 封装 权限申请的 类  参数:权限列表
// 封装了两个异步函数 并且返回值是 boolean 类型 调用时需要与await配合使用
class Permission {
  //一次请求 用户权限
  async requestPermissions(permissions: Permissions[]) {
     const atManager=abilityAccessCtrl.createAtManager()
    //类中获取上下文 需要配合AppStorageV2.connect(savedContext)!.context
     const ctx=AppStorageV2.connect(savedContext)!.context
     if(ctx){
       const result =await atManager.requestPermissionsFromUser(ctx,permissions)
       return result.authResults.every(result=>result===abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
     }
     return false

   }

   //二次
  async openPermissionSetting(permissions: Permissions[]){
    const  atManager =abilityAccessCtrl.createAtManager()
    const  ctx=AppStorageV2.connect(savedContext)!.context
    if(ctx){
      const authResults=await atManager.requestPermissionOnSetting(ctx,permissions)
      return authResults.every(result=>result===abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)
    }
    return false
  }

}

export const permission =new Permission()