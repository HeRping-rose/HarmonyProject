<template>
	<view class="box">
		<!-- 头部导航 -->
		<view class="zuo2" style="">
			<text class="icon iconfont icon-zuo"></text>
		</view>
		<view class="toubu" :style="a">
			<view class="zuo1" @click="$router.back()">
				<text class="icon iconfont icon-zuo"></text>
			</view>
			<view class="zhognjian">
				<text>商品</text>
				<text>评价</text>
				<text>详情</text>
			</view>
			<view class="you1">
				
			</view>
		</view>
		<!-- 轮播图 -->
		<view>
			<swiper class="swiper" :indicator-dots="true" :autoplay="true" :circular="true" :interval="3000">
				<swiper-item v-for="i in detail.swiper">
					<image class="img" :src="'http://121.5.53.212:3000/'+i"></image>
				</swiper-item>
			</swiper>
		</view>
		<view class="introduce">
			<view>
				<h3>{{detail.name}}</h3>
			</view>
			<view class="zhong">
				<view class="top">
					￥<text>{{detail.price}}</text>
				</view>
				<view class="center">
					￥<text>{{detail.originalPrice}}</text>
				</view>
				<view class="bottom">
					<text>免邮费</text>
				</view>
			</view>
			<view class="xia">
				<text>销量:{{detail.sales}}</text>
				<text>库存:{{detail.store}}</text>
				<text>浏览量:{{detail.views}}</text>
			</view>
		</view>
		<!-- 该商品分享可领49减10红包 -->
		<view class="fenxiang">
			<view class="fan">
				<text class="icon iconfont icon-xingxing1"></text> <text class="xingxing1">返</text>
			</view>
			<view style="font-size: 30rpx; color: #666;">
				<text>该商品分享可领49减10红包</text>
			</view>
			<view class="liji">
				<text>立刻分享</text>
				<text class="icon iconfont icon-you"></text>
			</view>
		</view>
		<!-- 购买类型 -->
		<view class="fenxiang1">
			<view class="zuo">
				<text style="color: #666;">购买类型</text>
			</view>
			<view class="zhong1" style=" font-size: 30rpx; color: #666;">
				<text>3-6个月</text>
				<view style="width: 5rpx;display: inline-block;padding: 0;">

				</view>
				<text>1-2岁</text>
			</view>
			<view class="you">
				<text style="font-size: 25rpx;color: #666;" class="icon iconfont icon-you"></text>
			</view>
		</view>
		<!-- 优惠券 -->
		<view class="fenxiang1">
			<view class="zuo">
				<text style="color: #666;">优惠券</text>
			</view>
			<view class="zhong1" style=" font-size: 28rpx; color: #ff536f;display: inline-block;">
				<text>领取优惠券</text>
			</view>
			<view class="you">
				<text style="font-size: 25rpx;color: #666;" class="icon iconfont icon-you"></text>
			</view>
		</view>
		<!-- 服务 -->
		<view class="fenxiang1">
			<view class="zuo">
				<text style="color: #666;">服务</text>
			</view>
			<view class="zhong1" style=" font-size: 30rpx; color: #666;">
				<text>七天无理由退换货·</text>
				<view style="width: 5rpx;display: inline-block;padding: 0;">
			
				</view>
				<text>假一赔十·</text>
			</view>
			<view class="you" ></view>
		</view>
		<view style="height: 15rpx;background-color:#efefef;"></view>
		<!-- 商品评价 -->
		<view class="fenxiang1">
			<view class="zuo">
				<h3 style="display: inline-block;">商品评价</h3><text>(0)</text>
			</view>
			
			<view class="you" >
				<text style="font-size: 25rpx;color: #666;">好评率100%</text>
				<text style="font-size: 25rpx;color: #666;" class="icon iconfont icon-you"></text>
			</view>
		</view>
		<view style="height: 15rpx;background-color:#efefef;"></view>
		<!-- 图文详情 -->
		<view class="tuwen">
			<view class="tou">
				<text>——图文详情——</text>
			</view>
			<view class="xiangqing" v-html="detail.content">
				
			</view>
		</view>
		<view style="height: 30rpx;">
			
		</view>
		<view class="dibu">
			<view class="iconsho">
				<text class="icon iconfont icon-shouye"></text>
				<text>首页</text>
			</view>
			<view class="iconsho" @click="gotoCart()">
				<text class="icon iconfont icon-gouwu"></text>
				<text>购物车</text>
			</view>
			<view class="iconsho">
				<text class="icon iconfont icon-shoucang-chanpinxiangqing"></text>
				<text>收藏</text>
			</view>
			<view class="youbian">
				<text @click="showpop()" style="background-color:orange;border-radius: 50rpx 0 0 50rpx;">加入购物车</text>
				<text style="background-color:#ff536f;border-radius: 0 50rpx 50rpx 0 ;">立即购买</text>
			</view>
		</view>
		<uni-popup ref="popup" type="bottom" style="z-index: 100000000000;">
			<view class="popup">
				<view class="top">
					<view class="pic">
						<image v-if="table.pic" :src="'http://121.5.53.212:3000/'+table.pic" mode=""></image>
						<image v-else :src="'http://121.5.53.212:3000/'+detail.img" mode=""></image>
					</view>
					<view class="disc">
						<view class="price">￥{{table.price}}</view>
						<view class="store">库存：{{table.store}}</view>
						<view>规格：{{table.size}}</view>
					</view>
					<view @click="close()">
						X
					</view>
				</view>
				<view class="rules" v-for="(i,index) in detail.tags">
					<text class="name"><b>{{i.name}}</b> </text>
					<view >
						<text class="xuan" v-for="j in i.items" @click="xuanzhong(index,j)" :class="{active:j==current[index]}" >{{j}}</text>
					</view>
				
				</view>
				<view class="rules">
					<text>数量</text>
					<view style="display: flex;">
						<button style="width: 20rpx;" type="default" @click="count>1&&count--">-</button>
						<input type="text" v-model="count" />
						<button style="width: 20rpx;" type="default" @click="count<table.store&&count++">+</button>
					</view>
				</view>
				<view class="confirm">
					<button type="primary" @click="confirm()">确认</button>
				</view>
			</view>
		</uni-popup>
	</view>
</template>

<script>
import uniPopup from '@/components/uni-popup/uni-popup.vue'
	export default {
		components: {
			uniPopup
		},
		data() {
			return {
				active2: 0,
				a:0,//头部导航的透明度
				detail: {},
				table: {},
				count:1,
				current:[]
			}
		},
		methods: {
		gotoCart(){
			uni.switchTab({
				url:"/pages/cart/cart"
			})
		},
		confirm(){
			let obj = {
				goodsId:this.detail._id,
				pic:this.table.pic || this.detail.img,
				name:this.detail.name,
				size:this.current.join(" "),
				price:this.table.price || this.detail.price,
				count:this.count,
				user:"小明"
			}
			uni.request({
				method:"POST",
				url:"http://121.5.53.212:3000/cart",
				data:obj,
				success: (res) => {
					console.log(res)
					this.$refs.popup.close()
					uni.showToast({
						title:res
					})
				}
			})
		},
		xuanzhong(i,j){
			this.current[i]=j;
			let str = this.current.join(' ');
			this.table = this.detail.table.filter(i=>i.size==str)[0];
			
		},
		close(){
			this.$refs.popup.close()
		},
		showpop(){
			this.$refs.popup.open()
		},
		onPageScroll(e) { //根据距离顶部距离是否显示顶部按钮
				// console.log(e.scrollTop.toFixed())
				let a = e.scrollTop.toFixed()
				this.a = "opacity:"+(a/174).toFixed(1)
				// console.log(this.a)
			}
		},
		onShow(){
				uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/detail",
				data:{
					_id:this.$route.query._id
				},
				success: (res) => {
					this.detail = res.data;
					this.table = this.detail.table[0];
					let arr = []
					this.detail.tags.forEach(i=>{
						arr.push(i.items[0])
					});
					this.current = arr
					console.log(this.current)
				}
			})
			
			
		}
	}
</script>

<style lang="scss">
	.popup {
		background: #fff;
		border-top-left-radius: 10rpx;
		border-top-right-radius: 10rpx;
		
		.top {
			display: flex;
		
			
			.pic {
				width: 200rpx;
				
				image {
					width: 100%;
					height: 200rpx;
				}
			}
			
			.disc {
				flex:1;
				display: flex;
				flex-direction: column;
				
			}
		}
		
		.active {
			border: 1px solid #ff536f;
			background: #ffbbcb;
			color: #ff536f;
		}
	}
	.box {
		padding: 0;
		margin: 0;
		box-sizing: border-box;
		position: static;
		
		// 头部黑色返回键
		.zuo2{
			position: fixed;
			top: 30rpx; 
			left: 25rpx;
			z-index: 1111;
			background-color: rgba(0,0,0,.5);
			display: inline-block;
			color: #FFF;
			text-align: center;
			line-height: 50rpx;
			width: 50rpx;
			height: 50rpx;
			border-radius: 25rpx;
		}
		//头部导航
		.toubu{
			display: flex;
			height: 100rpx;
			position: fixed;
			top: 0rpx;
			left: 0rpx;
			width: 100%;
			background-color: #fff;
			z-index: 99999999;
			.zuo1{
				flex: 1;
				line-height: 100rpx;
				margin-left: 20rpx;
			}
			.zhognjian{
				flex: 3;
				display: flex;
				justify-content: space-around;
				align-items: center;
			}
			.you1{
				flex: 1;
			}
		}
		//底部导航
		.dibu{
			position: fixed;
			bottom: 0rpx;
			left: 0rpx;
			width: 100%;
			height: 100rpx;
			background-color: #fff;
			box-shadow: 0 10rpx 10rpx 10rpx rgba(0,0,0,.2);
			display: flex;
			justify-content: space-around;
			align-items: center;
			.iconsho{
				flex: 1;
				display: flex;
				flex-direction: column;
				align-items: center;
				font-size: 28rpx;
			}
			.youbian{
				flex: 4;
				text-align: center;
				text{
					display: inline-block;
					color: #fff;
					padding: 20rpx 30rpx;
					font-size: 30rpx;
				}
			}
		}
		
		
		// 图文详情
		.tuwen{
			.xiangqing{
				image{
					width: 100%;
					height: 1050rpx;
				}
			}
			.tou{
				display: flex;
				align-items: center;
				justify-content: center;
				height: 100rpx;
			}
		}
		// 购买类型
		.fenxiang1 {
			border-bottom: 1px solid #f0f0f0;
			padding: 20rpx 0;
			display: flex;
			align-items: center;
			justify-content: space-between;
			font-size: 28rpx;

			.zuo {
				flex: 2;
			}

			.zhong1 {
				flex: 5
			}

			.you {
				flex: 1;
				display: flex;
				justify-content: flex-end;
				align-items: center;
			}

			view {
				padding: 0 25rpx;
			}
		}
		// 该商品分享可领49减10红包
		.fenxiang {
			width: 750rpx;
			padding: 20rpx 0;
			background-color: #fff0f1;
			display: flex;
			align-items: center;

			.liji {
				margin-right: 25rpx;
				flex: 2;
				display: flex;
				justify-content: flex-end;
				color: #ff536f;

				text {
					font-size: 25rpx;
				}
			}

			.fan {
				margin: 0 25rpx;
				font-size: 25rpx;
				border: 1px solid #ff536f;

				.icon-xingxing1 {
					display: inline-block;
					padding: 0rpx 5rpx 1rpx 0rpx;
					background-color: #ff536f;
					border-radius: 0 10rpx 10rpx 0;
					color: #fff;
				}

				.xingxing1 {
					color: #ff536f;
					margin: 0 15rpx 0 10rpx;
				}
			}
		}
		// 产品名称，规格
		.introduce {
			padding: 20rpx 30rpx;

			view {
				margin: 15rpx 0;
			}

			.zhong {
				display: flex;
				align-items: center;

				view {
					margin: 0 10rpx;
				}

				.top {
					margin: 0;
					font-size: 35rpx;
					color: #ff536f;
				}

				.center {
					font-size: 30rpx;
					text-decoration: line-through;
					color: #888888;
				}

				.bottom {
					background-color: #ff536f;
					font-size: 26rpx;
					color: #FFF;

					text {
						display: inline-block;
						padding: 5rpx 10rpx;
					}
				}
			}

			.xia {
				display: flex;
				justify-content: space-between;
				align-items: center;
				font-size: 28rpx;
				color: #888888;
			}

			h3 {
				display: inline-block;
			}
		}

		// 轮播图
		.swiper {
			width: 750rpx;
			height: 750rpx;

			.img {
				width: 100%;
				height: 100%;
			}
		}
	}
</style>
