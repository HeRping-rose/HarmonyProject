import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false
App.mpType = 'app'

import header from "./components/header.vue"
Vue.component("myHeader",header)

import myList from "./components/myList.vue"
Vue.component("myList",myList)

import empty from "./components/empty.vue"
Vue.component("myEmpty",empty)

//axios 是一个前端后通用的ajax库 (原生的js,vue,react,node)
//现在有小程序， fly-io

Vue.mixin({
	data(){
		return {
			URL:'http://121.5.53.212:3000/'
		}
	},
	methods:{
		navTo(url){
			uni.navigateTo({url})
		},
		switchTo(url){
			uni.switchTab({url})
		}
	}
})

const app = new Vue({
    ...App
})
app.$mount()
