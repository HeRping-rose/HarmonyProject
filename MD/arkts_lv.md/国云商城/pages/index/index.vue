<template>
	<view class="content">
		<my-header></my-header>
		<swiper 
		:indicator-dots="true" 
		:autoplay="true" 
		:interval="3000" 
		:duration="1000"
		previous-margin="50rpx"
		next-margin="50rpx"
		:circular="true"
		class="swiper"
		@change="getCurrent"
		>
			<swiper-item class="swiper_item" v-for="(i,j) in banner">
				<image :src="i" :class="{active:j==active2}" mode="aspectFill"></image>
			</swiper-item>
		</swiper>
		<view class="nav">
			<view class="nav_item" v-for="i in nav">
				<image :src="i.pic" mode=""></image>
				<text>{{i.text}}</text>
			</view>
		</view>
		<view class="ad">
			<image src="../../static/index/1595678629354086093.png" mode="">
			</image>
		</view>
		<!-- 热门推荐 -->
		<view class="hot">
			<view class="left">
				<image src="../../static/index/hot.png"></image>
			</view>
			<view class="center">
				<text class="text1">热门推荐</text>
				<text>Popular Recommendation</text>
			</view>
			<view class="right">
				<text class="iconfont icon-you"></text>
			</view>
		</view>
		<!-- 列表 -->
		<my-list :list="list"></my-list>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'Hello',
				banner:[
					"../../static/index/1595833354066324005.jpg",
					"../../static/index/1595833443068049276.jpg",
					"../../static/index/1595833524878383141.jpg"
				],
				active2:"",
				nav:[
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					},
					{
						text:"精选大牌",
						pic:"../../static/index/47512f19-99d1-4ffd-b5af-3b48535e46a4.png",
						link:"pages/category/category"
					}
				],
				list:[
				],
				pageSize:4,
				currentPage:1,
				activeLength:4
			}
		},
		onShow(){
			this.getData()
		},
		onReachBottom(){
			console.log("到底了")
			uni.showLoading({
			    title: '加载中'
			});
			this.currentPage++;
			this.getData()
			
		},
		methods: {
			getData(){
				if(this.activeLength < this.pageSize){
					uni.hideLoading();
					uni.showToast({
					    title: '没有更多数据了',
					    duration: 2000
					});
					return;
				}
				uni.request({
					method:"GET",
					url:"http://121.5.53.212:3000/hot",
					data:{
						pageSize:this.pageSize,
						currentPage:this.currentPage
					},
					success:(res)=>{
						console.log(res)
						this.activeLength = res.data.length;
						this.list = this.list.concat(res.data)
						uni.hideLoading()
					}
				})
			},
			getCurrent(e){
				// console.log(e.detail.current)
				this.active2 = e.detail.current
			}
		}
	}
</script>

<style lang="scss">
.swiper {width:750rpx;height: 300rpx;}
.swiper_item { width: 100%;height: 300rpx;}
.swiper image {
	height: 300rpx;width: 100%;
	transform: scale(0.94, 0.88);
	transition: transform .36s;
	border-radius: 10rpx;
	}
.swiper .active { transform: scale(1);}
.nav {
	margin: 20rpx 0 ;
	display: flex;
	flex-wrap: wrap;
}
.nav .nav_item {
	width: 25%;
	height: 140rpx;
	display: flex;
	/* justify-content: center; */
	flex-direction: column;
	align-items: center;
	font-size: 25rpx;
}
.nav .nav_item image {
	width: 50%;
	height: 90rpx;
}
.ad { margin: 0 20rpx; height: 180rpx;}
.ad image { width: 100%;height: 100%; }
.hot{
	display: flex;
	height: 80rpx;
	padding: 10rpx;
	margin-top: 20rpx;
	.left{
		flex: 1;
		image{
			width: 80rpx;
			height: 80rpx;
		}
	}
	.center{
		flex: 5;
		display: flex;
		flex-direction: column;
		color: #ccc;
		font-weight: normal;
		font-size: 24rpx;
		.text1{
			color: black;
			font-size: 30rpx;
			line-height: 40rpx;
			font-weight: bold;
		}
	}
	.right{
		flex: 0.5;
		line-height: 43px;
		align-items: center;
	}
}

</style>
