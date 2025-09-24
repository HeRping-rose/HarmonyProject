<template>
	<view class="my">
		<view class="top">
			<image class="u-bg" src="/static/bg/user.jpg"></image>
			<view class="user-wrapper">
				<image 
				class="avatar" 
				@click="navTo('./userInfo')"
				:src="(user.avatar&&URL + user.avatar) ||'../../static/icon/default-avatar.png'"
				></image>
				<view class="cen column" >
					<text v-if="!user.username" class="username f-m" @click="navTo('/pages/login/login')">
						请登录
					</text>
					<text v-else>{{user.nickName || user.username}}</text>
					<text @click="logout" class="user-group" v-if="user.username">
					退出
					</text>

				</view>
				<!-- <view class="login-box" >
					<text>请登录</text>
				</view> -->
			</view>
			<image class="arc-line" src="/static/icon/arc.png" mode="aspectFill"></image>
		</view>
		
		<view class="money-wrap">
			<view class="item center" hover-class="hover-gray" >
				<text class="num">0</text>
				<text>余额</text>
			</view>
			<view class="item center" hover-class="hover-gray" :hover-stay-time="50">
				<text class="num">0</text>
				<text>优惠券</text>
			</view>
			<!--  hover-class="hover-gray" :hover-stay-time="50" -->
			<view class="item center">
				<text class="num">0</text>
				<text>积分</text>
			</view>
		</view>
		
		<!-- 订单 -->
		<view class="order-wrap">
			<view class="o-header row" >
				<text class="tit">我的订单</text>
				<text class="more">查看全部</text>
				<text class="mix-icon icon-you"></text>
			</view>
			<view class="o-list">
				<view class="item center" :hover-stay-time="50">
					<text class="mix-icon icon-daifukuan"></text>
					<text>待付款</text>
					
				</view>
				<view class="item center" >
					<text class="mix-icon icon-daifahuo"></text>
					<text>待发货</text>
					
				</view>
				<view class="item center">
					<text class="mix-icon icon-yishouhuo"></text>
					<text>待收货</text>
					
				</view>
				<view class="item center" >
					<text class="mix-icon icon-daipingjia"></text>
					<text>待评价</text>
					
				</view>
			</view>
		</view>
		<view class="main">
			<view class="floor-header row" @click="navTo('/pages/list/list')">
				<view class="cell-icon mix-icon icon-iconfontweixin icon" style="color: rgb(250, 67, 106);">
					
				</view>
				<view class="column fill">
					<text class="tit">我的钱包</text>
					
				</view>
				<text class="cell-more mix-icon icon-you"></text>
			</view>
			<view class="floor-header row" @click="navTo('/pages/list/list')">
				<view class="cell-icon mix-icon icon-dizhi icon" style="color: rgb(95, 205, 162);">
					
				</view>
				<view class="column fill">
					<text class="tit">地址管理</text>
					
				</view>
				<text class="cell-more mix-icon icon-you"></text>
			</view>
			<view class="floor-header row" @click="navTo('/pages/list/list')">
				<view class="cell-icon mix-icon icon-shoucang_xuanzhongzhuangtai icon" style="color: rgb(84, 180, 239);">
					
				</view>
				<view class="column fill">
					<text class="tit">我的收藏</text>
					
				</view>
				<text class="cell-more mix-icon icon-you"></text>
			</view>
			<view class="floor-header row" @click="navTo('/pages/list/list')">
				<view class="cell-icon mix-icon icon-pinglun-copy icon" style="color: rgb(238, 136, 59);">
					
				</view>
				<view class="column fill">
					<text class="tit">意见反馈</text>
					
				</view>
				<text class="cell-more mix-icon icon-you"></text>
			</view>
			
			<view class="floor-header row" @click="navTo('/pages/list/list')">
				<view class="cell-icon mix-icon icon-shezhi1 icon" style="color: rgb(55, 176, 251);">
					
				</view>
				<view class="column fill">
					<text class="tit">设置</text>
					
				</view>
				<text class="cell-more mix-icon icon-you"></text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				user:{}
			}
		},
		onShow() {
			let username = uni.getStorageSync("username")
			if(username){
				uni.request({
					method:"GET",
					url:"http://121.5.53.212:3000/user",
					data:{
						username
					},
					success: (res) => {
						console.log(res)
						this.user = res.data
					}
				})
			}else{
				uni.navigateTo({
					url:"/pages/login/login"
				})
			}
		},
		methods: {
			logout(){
				uni.removeStorageSync("username");
				this.navTo("/pages/login/login")
			}
		}
	}
</script>

<style lang="scss">
	page{
		background-color: #f7f7f7;
	}
	.my{
		padding-bottom: 20rpx;
	}
	.top{
		position: relative;
		overflow: hidden;
		padding-top: calc(var(--status-bar-height) + 52rpx);	
		padding-bottom: 6rpx;
			
		.u-bg{
			position: absolute;
			left: 0;
			top: 0;
			width: 100%;
			height: 330rpx;
		}
		.user-wrapper{
			display:flex;
			flex-direction: column;
			flex-direction: row;
			align-items: center;
			position: relative;
			z-index: 5;
			padding: 20rpx 30rpx 60rpx;
		}
		.login-box{
			font-size: 36rpx;
			color: #fff;
		}
		.avatar{
			flex-shrink: 0;
			width: 130rpx;
			height: 130rpx;
			border-radius: 100px;
			margin-right: 24rpx;
			border: 4rpx solid #fff;
			background-color: #fff;
		}
		.username{
			font-size: 34rpx;
			color: #fff;
		}
		.user-group{
			align-self: flex-start;
			padding: 10rpx 16rpx;
			margin-top: 16rpx;
			font-size: 20rpx;
			color: #fff;
			background-color: rgba(255,255,255,.3);
			border-radius: 100rpx;
		}
		.arc-line{
			position: absolute;
			left: 0;
			bottom: 0;
			z-index: 9;
			width: 100%;
			height: 32rpx;
		}
	}
	 
	.money-wrap{
		display:flex;
		justify-content: space-around;
		width: 700rpx;
		margin: 6rpx auto 0;
		padding: 14rpx 0;
		background: #fff;
		border-radius: 10rpx;
		
		.item{
			flex-direction: column;
			width: 130rpx;
			height: 120rpx;
			border-radius: 8rpx;
			font-size: 24rpx;
			color: #606266;
		}
		.num{
			margin-bottom: 20rpx;
			font-size: 32rpx;
			color: #333;
			font-weight: 700;
		}
	}
	
	
	.order-wrap{
		width: 700rpx;
		margin: 20rpx auto 0;
		background: #fff;
		border-radius: 10rpx;
		
		.o-header{
			padding: 28rpx 20rpx 6rpx 26rpx;
			
			.tit{
				flex: 1;
				font-size: 32rpx;
				color: #333;
				font-weight: 700;
			}
			.more{
				font-size: 24rpx;
				color: #999;
			}
			.icon-you{
				margin-left: 4rpx;
				font-size: 20rpx;
				color: #999;
			}
		}
		.o-list{
			display:flex;
			justify-content: space-around;
			padding: 20rpx 0;
		}
		.item{
			flex-direction: column;
			width: 130rpx;
			height: 130rpx;
			border-radius: 8rpx;
			font-size: 24rpx;
			color: #606266;
			position: relative;
			
			.mix-icon{
				font-size: 50rpx;
				margin-bottom: 20rpx;
				color: #fa436a;
			}
			.icon-shouhoutuikuan{
				font-size: 44rpx;
			}
		}
		.number{
			position: absolute;
			right: 22rpx;
			top: 6rpx;
			min-width: 34rpx;
			height: 34rpx;
			line-height: 30rpx;
			text-align: center;
			padding: 0 8rpx;
			font-size: 18rpx;
			color: #fff;
			border: 2rpx solid #fff;
			background-color: #ff55ff;
			border-radius: 100rpx;
		}
	}
	.main{
		
	background-color: #fff;
	width:  700rpx;
	margin: 0 auto;
	}
	.floor-header{
		margin-top: 20rpx;
		height: 80rpx;
		font-size: 34rpx;
		color: #999;
		background-color: #fff;
		
		.icon{
		text-align: center;

			margin: 10rpx 30rpx 10rpx 30rpx;
		}
		.tit-box{
			flex: 1;
			display: flex;
			flex-direction: column;
		}
		.tit{
			margin-bottom: 10rpx;
			font-size: 34rpx;
			color: #333;
			// font-weight: 700;
		}
		.icon-you{
			font-size: 20rpx;
			padding-right: 20rpx;
			color: #999;
		}
	}
</style>
