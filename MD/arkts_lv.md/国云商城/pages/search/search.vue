<template>
	<view class="app column">
		<view class="search-wrap center">
			<view class="input-box row">
				<text class="iconfont icon-sousuo"></text>
				<input 
					class="input"
					type="text" 
					placeholder="请输入搜索关键字" 
					maxlength="20"
					v-model="keyword" 
					@confirm="search"
					confirm-type="search"
				/>
				<text v-if="keyword" class="close" @click="clearInput">x</text>
			</view>
			<view class="search-btn center" @click="search">
				<text>搜索</text>
			</view>
		</view>
		
		<view class="content">
			<view v-if="historyList.length > 0" class="s-header row">
				<text class="tit">历史搜索</text>
				<text class="iconfont icon-laji" @click="showPopup()"></text>
			</view>
			<view v-if="historyList.length > 0" class="list" style="margin-bottom: 20rpx;">
				<view class="item center" v-for="(item, index) in historyList" :key="index" @click="search(item)">
					<text>{{ item }}</text>
				</view>
			</view>
			<view v-if="hotList.length > 0" class="s-header row">
				<text class="tit">热门搜索</text>
			</view>
			<view v-if="hotList.length > 0" class="list">
				<view class="item center" v-for="(item, index) in hotList" :key="index" @click="search(item.keyword)">
					<text>{{ item.keyword }}</text>
				</view>
			</view>
		</view>
		<uni-popup ref="popup" type="dialog" >
		    <uni-popup-dialog type="input" title="确定要删除？" :duration="2000" :before-close="true" @close="close" @confirm="confirm"></uni-popup-dialog>
		</uni-popup>
	</view>
</template>

<script>
import uniPopup from '@/components/uni-popup/uni-popup.vue'
import uniPopupMessage from '@/components/uni-popup/uni-popup-message.vue'
import uniPopupDialog from '@/components/uni-popup/uni-popup-dialog.vue'
export default {
	components: {
		uniPopup,
		uniPopupMessage,
		uniPopupDialog
	},
	data(){
		return {
			keyword:"",
			historyList:[],
			hotList:[]
		}
	},
	onShow(){
		this.historyList = uni.getStorageSync("historyList")
		uni.request({
			method:"GET",
			url:"http://121.5.53.212:3000/hotList",
			success: (res) => {
				console.log(res)
				this.hotList = res.data
			}
		})
	},
	methods:{
		showPopup(){
			 this.$refs.popup.open()
		},
		 close(done){
		   done()
		 },
		 confirm(done,value){
			 uni.removeStorageSync("historyList")
			 this.historyList = []
			 done()
		 },
		search(keyword){
			console.log(keyword)
			if(typeof keyword !== "string"){
				if(!this.keyword)return;
				let historyList = uni.getStorageSync("historyList") || []
				if(!historyList.includes(this.keyword)){
					historyList.push(this.keyword)
					uni.setStorageSync("historyList",historyList)
					this.historyList = historyList;
				}
				uni.request({
					method:"POST",
					url:"http://121.5.53.212:3000/hotList",
					data:{
						keyword:this.keyword
					},
					success: (res) => {
						console.log(res)
					}
				})
				uni.navigateTo({
					url:"/pages/list/list?keyword="+this.keyword
				})
				// this.keyword = "";
			}else{
				uni.navigateTo({
					url:"/pages/list/list?keyword="+keyword
				})
			}
		},
		clearInput(){
			this.keyword = ""
		}
	}
}
</script>

<style scoped lang='scss' scoped>
	.search-wrap{
		padding-left: 24rpx;
		height: 100rpx;
		display: flex;
		align-items: center;
		
		.icon-sousuo{
			padding: 0 12rpx 0 20rpx;
			font-size: 40rpx;
			color: #999;
		}
		.input-box {
			width: 604rpx;
			height: 80rpx;
			border-radius: 100rpx;
			background: #f5f6f7;
			display: flex;
			align-items: center;
		}
		.input{
			flex: 1;
			font-size: 30rpx;
			color: #333;
		}
		.close{
			/* padding: 10rpx 10rpx; */
			margin-right: 10rpx;
			font-size: 30rpx;
			color: #fff;
			background: #6d6d6d;
			border-radius: 18rpx;
			height: 36rpx;
			width: 36rpx;
			line-height: 36rpx;
			text-align: center;
		}
		.search-btn {
			flex-shrink: 0;
			padding: 0 24rpx 0 20rpx;
			font-size: 32rpx;
			color: #007aff;
		}
	}
	.content {
		flex: 1;
		padding-top: 24rpx;
		border-radius: 28rpx 28rpx 0 0;
		background-color: #fff;
	}
	.s-header{
		display: flex;
		justify-content: space-between;
		height: 80rpx;
		padding: 0 32rpx 0 40rpx;
		
		.tit{
			flex: 1;
			font-size: 30rpx;
			color: #333;
			font-weight: 700;
		}
		.icon-lajitong{
			padding: 10rpx;
			font-size: 36rpx;
			color: #333;
		}
	}
	.list{
		display: flex;
		flex-wrap: wrap;
		padding: 10rpx 0 0 36rpx;
		
		.item{
			min-width: 60rpx;
			height: 58rpx;
			padding: 0 24rpx;
			margin: 0 24rpx 24rpx 0;
			border-radius: 100rpx;
			background-color: #f5f6f7;
			font-size: 26rpx;
			color: #666;
		}
		.center {
			line-height: 58rpx;;
		}
	}
</style>
