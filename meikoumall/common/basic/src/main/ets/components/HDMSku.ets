import { Sku, HmSku, HmSpec } from '@ohmos/sku'
//安装应用第三方组件sku

// 取组件别名
export { Sku as HDMSku, HmSku as HDMSkuType, HmSpec as HDMSpec }

/*
 * import { Sku, HmSku, HmSpec } from '@ohmos/sku';

@Entry
@Component
struct Index {
  // 商品SKU集合 (依赖Data数据)
  @State skus: HmSku[] = []
  // 商品可选属性列表 (依赖Data数据)
  @State specs: HmSpec[] = []

  build() {
    Column() {
      Sku({
        specs: this.specs,
        skus: this.skus,
        onSkuChange: (sku: HmSku) => {
          // 选择商品SKU信息
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}*/

/*{
  "specs": [
    {
      "name": "颜色",
      "values": [
        {
          "name": "白色（女）",
          "picture": "https://yanxuan-item.nosdn.127.net/e19067221f1e4e93b2afca3973479496.png"
        },
        {
          "name": "蓝白（女）",
          "picture": "https://yanxuan-item.nosdn.127.net/51e0f8bd91e0a4987a797b2586be1ec1.png"
        },
        {
          "name": "白黑（男）",
          "picture": "https://yanxuan-item.nosdn.127.net/71354df110d7a93e1c46d51fcdd5840e.png"
        },
        {
          "name": "黑色（男）",
          "picture": "https://yanxuan-item.nosdn.127.net/032583c92671e01c7ca417210fa29c75.png"
        }
      ]
    },
    {
      "name": "尺码",
      "values": [
        {
          "name": "女S(35-36)"
        },
        {
          "name": "女L(39-40)"
        },
        {
          "name": "男M（40-41）"
        },
        {
          "name": "男L（42-43）"
        },
        {
          "name": "女M(37-38)"
        },
        {
          "name": "男XL(44-45)"
        }
      ]
    }
  ],
  "skus": [
    {
      "id": "300206063",
      "skuCode": "300206063",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 8542,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白色（女）"
        },
        {
          "name": "尺码",
          "valueName": "女S(35-36)"
        }
      ]
    },
    {
      "id": "300206064",
      "skuCode": "300206064",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 7136,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白色（女）"
        },
        {
          "name": "尺码",
          "valueName": "女M(37-38)"
        }
      ]
    },
    {
      "id": "300206065",
      "skuCode": "300206065",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 5350,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白色（女）"
        },
        {
          "name": "尺码",
          "valueName": "女L(39-40)"
        }
      ]
    },
    {
      "id": "300206066",
      "skuCode": "300206066",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 3910,
      "specs": [
        {
          "name": "颜色",
          "valueName": "蓝白（女）"
        },
        {
          "name": "尺码",
          "valueName": "女S(35-36)"
        }
      ]
    },
    {
      "id": "300206067",
      "skuCode": "300206067",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 5079,
      "specs": [
        {
          "name": "颜色",
          "valueName": "蓝白（女）"
        },
        {
          "name": "尺码",
          "valueName": "女M(37-38)"
        }
      ]
    },
    {
      "id": "300206068",
      "skuCode": "300206068",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 2411,
      "specs": [
        {
          "name": "颜色",
          "valueName": "蓝白（女）"
        },
        {
          "name": "尺码",
          "valueName": "女L(39-40)"
        }
      ]
    },
    {
      "id": "300206070",
      "skuCode": "300206070",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 4596,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白黑（男）"
        },
        {
          "name": "尺码",
          "valueName": "男M（40-41）"
        }
      ]
    },
    {
      "id": "300206071",
      "skuCode": "300206071",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 9179,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白黑（男）"
        },
        {
          "name": "尺码",
          "valueName": "男L（42-43）"
        }
      ]
    },
    {
      "id": "300206072",
      "skuCode": "300206072",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 9687,
      "specs": [
        {
          "name": "颜色",
          "valueName": "白黑（男）"
        },
        {
          "name": "尺码",
          "valueName": "男XL(44-45)"
        }
      ]
    },
    {
      "id": "300210060",
      "skuCode": "300210060",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 568,
      "specs": [
        {
          "name": "颜色",
          "valueName": "黑色（男）"
        },
        {
          "name": "尺码",
          "valueName": "男M（40-41）"
        }
      ]
    },
    {
      "id": "300210061",
      "skuCode": "300210061",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 2407,
      "specs": [
        {
          "name": "颜色",
          "valueName": "黑色（男）"
        },
        {
          "name": "尺码",
          "valueName": "男L（42-43）"
        }
      ]
    },
    {
      "id": "300210062",
      "skuCode": "300210062",
      "price": "65.00",
      "oldPrice": "65.00",
      "inventory": 7703,
      "specs": [
        {
          "name": "颜色",
          "valueName": "黑色（男）"
        },
        {
          "name": "尺码",
          "valueName": "男XL(44-45)"
        }
      ]
    }
  ]
}
*/

/* 属性值信息 */
export interface HmSpecValue {
  /* 属性文字值 */
  name: string
  /* 属性图片值 */
  picture: string | null
  /* 组件内（数据可忽悠）-选择状态 */
  selected: boolean | null
  /* 组件内（数据可忽悠）-禁用状态 */
  disabled: boolean | null
}

// /* 属性信息 */
// export interface HmSpec {
//   /* 属性名称 */
//   name: string
//   /* 属性可选择的值 */
//   values: HmSpecValue[]
// }
//
// /* SKU包含属性信息 */
// export interface HmSpecSelected {
//   /* 属性名称 */
//   name: string
//   /* 属性值 */
//   valueName: string
// }

/* SKU信息 */
// export interface HmSku {
//   /* SKU ID */
//   id: string
//   /* SKU 码 */
//   skuCode: string
//   /* SKU 现价 */
//   price: string
//   /* SKU 原价 */
//   oldPrice: string
//   /* SKU 库存 */
//   inventory: number
//   /* SKU 包含属性集 */
//   specs: HmSpecSelected[]
//   /* SKU 包含属性值拼接（onSkuChange 获取） */
//   specsText: string | null
//   /* SKU 对应商品图片（onSkuChange 获取） */
//   picture: string | null
// }
