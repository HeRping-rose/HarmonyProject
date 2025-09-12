export interface TabListType{
  text: string;
  icon: ResourceStr;
  selectedIcon:ResourceStr
}

export interface CateMenuType{
  id:number,
  name:string,
  icon:ResourceStr,

  // "description": "3512351346",
  // "created_at": "2025-09-03T02:51:28.190410Z",
  // "updated_at": "2025-09-03T02:51:28.190445Z"
  // description:string,
  // created_at:string,
  // updated_at:string
}

export interface ShopListType{
  name:string,
  icon: ResourceStr,
  phone:string,
  address:string,
  activity:string,
  business_hours:string,
  is_open:boolean,
  created_at:string,
  updated_at:string
}

export interface ResponseData<T>{
  msg:string,
  code:string,
  data:T
}
export const serverUrl='http://192.168.0.74:8000/'