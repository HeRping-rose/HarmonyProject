// 我的功能
interface Nav {
  icon: ResourceStr
  name: string
  onClick?: () => void
  other?: string
}

// 我的工具
interface Tool {
  icon: ResourceStr
  name: string
  value?: string
  onClick?: () => void
}

export { Nav, Tool }