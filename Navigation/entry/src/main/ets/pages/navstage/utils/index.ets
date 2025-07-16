import { AppStorageV2, PersistenceV2 } from "@kit.ArkUI"

let pageStack:NavPathStack= new NavPathStack()

@ObservedV2
class User {
  @Trace username: string
  @Trace password: string

  constructor(obj:Iuser) {
    this.username =obj.username
    this.password = obj.password
  }
}

interface Iuser{
  username: string
  password: string
}


// AppStorageV2   PersistenceV2持久化
let  user: User = PersistenceV2.connect(User, 'user', () => new User({
  username: '',
  password: ''
}))! //类似于  as User  非空断言

export { pageStack, user }