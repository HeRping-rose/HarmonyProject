<template>
	<view class="order">
		
		<view class="list">
			<view class="header" @click="navTo('/pages/address/address')">
				<view v-if="!currentAddress">
					<text class="mix-icon icon-dizhi"></text>
					<text>请选择收货地址</text>
				</view>
				<view v-else class="addr-wrap">
					<text class="mix-icon icon-dizhi"></text>
					<view class="con column">
						<text class="addr">{{currentAddress.address }}</text>
						<text class="name">{{ currentAddress.consignee }} {{ currentAddress.phone }}</text>
					</view>
				</view>
					<text class="mix-icon icon-you"></text>
			</view>
			<image class="img" src="../../static/icon/addr-line.png" mode=""></image>
			
	    <view class="list-item" v-for="i in order">
		<view class="img">
			<image :src="URL+i.pic" mode=""></image>
			</view>
		<view class="right">
			<text class="title">{{i.name}}</text>
			<text class="size">{{i.size}}</text>
			<text class="price">￥{{i.price}}<text class="count">X{{i.count}}</text></text>
		</view>
		</view>
			
			<view class="list-item1">
				<view class="list-item1-1">
					<view class="title">商品金额</view>
					<view class="price">￥{{total}}</view>
				</view>
				<view class="list-item1-1">
					<view class="title">
							<text class="tag">满</text>
						订单满减</view>
					<view class="price">-￥0.00</view>
				</view>
				<view class="list-item1-1">
					<view class="title">
					<text class="tag1">券</text>
						优惠券</view>
					<view class="price1">暂无可用</view>
				</view>
				<view class="list-item1-1">
					<view class="title">
						配送费</view>
					<view class="price">￥0</view>
				</view>
			</view>
			<view class="price2">小计:<text>￥{{total}}</text></view>
			<view class="text">订单备注:
			<text>选填,合理需求我们会尽量满足...</text>
			</view>
		</view>
		<view class="bottom">
		<view class="price">
			实付款:
		<text>￥{{total}}</text>
		</view>
		<view class="btn" @click="submit()">
			提交订单
		</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				order:[],
				currentAddress:""
			}
		},
		onShow() { 
			this.order = uni.getStorageSync("order");
			this.currentAddress = uni.getStorageSync("currentAddress");
		},
		computed:{
			total(){
				return this.order.reduce((t,j)=>t+=j.count*j.price,0)
			}
		},
		methods:{
			submit(){
				let obj = {
					address:this.currentAddress,
					order:this.order,
					total:this.total,
					state:'unpaid',
					user:this.currentAddress.user
				}
				uni.request({
					method:"post",
					url:"http://121.5.53.212:3000/order",
					data:obj,
					success: (res) => {
						console.log(res)
						uni.navigateTo({
							url:"/pages/pay/pay?id="+res.data._id
						})
					}
				})
			}
		}
	}
</script>

<style scoped lang="scss">
	page{
	background-color:#F0F0F0 !important;
	}
.order{

	.list{
		padding:10rpx 20rpx;
		.header{
			margin-top: 10rpx;
			font-size:30rpx;
			display: flex;
			align-items: enter;
			justify-content: space-between;
			padding: 30rpx 10rpx;
			border-radius: 10rpx;
			background: #fff;
		    color:#555555;
			.icon-dizhi{
				margin: 0 20rpx;
				color: #ff007f;
			}
			.icon-you{
				margin-right: 20rpx;
			}
		}
		.img{
			width: 100%;
			height:2rpx;
			margin-bottom:20rpx;
		}
	
		.list-item{
			margin-bottom:5rpx;
			margin-top:10rpx;
			padding:10rpx 20rpx;
			background: #fff;
			border-top-left-radius: 10rpx;
			border-top-right-radius: 10rpx;
			display: flex;
			.img{
				width:160rpx;
				height:160rpx;
				margin-right: 20rpx;
				border-radius: 10rpx;
				overflow: hidden;
				
				image{
					width: 100%;
					height: 100%;
				}
			}
			.right{
				font-size:28rpx;
				display: flex;
				flex-direction:column;
				.title{
					font-size:28rpx;
					line-height:30rpx;
				}
				.price{
					font-size:28rpx;
				    color: #000;
					font-size:30rpx;
				}
				.size{
					font-size:28rpx;
					margin:30rpx 0;
					color:#999999;
				}
				.count{
					margin-left: 20rpx;
					margin-bottom:4rpx;
					font-size:28rpx;
					color:#999999;
				}
			}
		}
		.list-item1{
				font-size: 20rpx;
				margin:3rpx 0;
				background: #FFFFFF;
			.list-item1-1,.list-item1-2{
				font-size:26rpx;
				padding:20rpx 30rpx;
				display: flex;
				justify-content:space-between;
				align-items: center;
				.price{
					font-weight: bold;
				}
				.price1{
					color: #878787;
				}
			}
			.tag{
				padding: 6rpx 8rpx;
				margin-right: 8rpx;
				font-size: 20rpx;
				color: #fff;
				border-radius: 8rpx;
				background-color: orange;
				
				&.red{
					background-color:#ff007f;
				}
			}
			.tag1{
				padding: 6rpx 8rpx;
				margin-right: 8rpx;
				font-size: 20rpx;
				color: #fff;
				border-radius: 8rpx;
				background-color:#ff007f;
				
				&.red{
					background-color:#ff007f;
				}
			}
		}
		.price2{
			margin-top:3rpx;
			font-size:30rpx;
			padding: 20rpx;
			background: #fff;
			display: flex;
			justify-content:flex-end;
			align-items: center;
			border-bottom-left-radius: 10rpx;
			border-bottom-right-radius: 10rpx;
			text{font-weight: bold;}
		}
		.text{
			font-size:28rpx;
			padding: 30rpx 30rpx 100rpx;
			border-radius:10rpx;
			background: #fff;
			margin-top:20rpx;
			font-weight: bold;
			text{
				font-size: 28rpx;
				display: flex;
				font-weight:normal;
				line-height:50rpx;
				color: #878787;
			}
			
		}
	}
	.bottom{
		align-items: center;
		width: 100%;
		position:fixed;
		bottom: 0;
		left: 0;
		display:flex;
		background: #fff;
		padding:20rpx 30rpx;
		font-size:30rpx;
		justify-content: space-between;
		.price{
			color: #878787;
			text{
				margin-left: 20rpx;
				font-size:34rpx;
				color:#ff536f;
				font-weight: bold;
			}
		}
		.btn{
			color: #fff;
			padding:15rpx 30rpx;
			border-radius:40rpx;
			background: #ff536f;
		}
	}
	
}
</style>
