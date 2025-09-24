<template>
	<view class="app column">
		<view class="price-wrapper center column">
			<text>支付金额</text>
			<text class="price">{{pay.total}}</text>
		</view>
		
		<view class="cell row b-b" @click="checkType('wxpay')">
			<image class="icon" src="../../static/icon/wxpay.png"></image>
			<view class="column fill">
				<text class="tit">微信支付</text>
			</view>
			<text v-if="curType === 'wxpay'" class="icon-xuanzhong iconfont icon-2xuanzhong"></text>
		</view>
		<!-- #ifndef MP-WEIXIN -->
		<view class="cell row b-b" @click="checkType('alipay')">
			<image class="icon" src="../../static/icon/alipay.png"></image>
			<view class="column fill">
				<text class="tit">支付宝</text>
			</view>
			<text v-if="curType === 'alipay'" class="icon-xuanzhong iconfont icon-2xuanzhong"></text>
		</view>
		<!-- #endif -->
		<view class="cell row b-b" @click="checkType('balance')">
			<image class="icon" src="../../static/icon/balance.png"></image>
			<view class="column fill">
				<text class="tit">余额</text>
				<text class="tip">账户可用余额 ￥4545</text>
			</view>
			<text v-if="curType === 'balance'" class="icon-xuanzhong iconfont icon-2xuanzhong"></text>
		</view>
		<button type="default" style="background: #0062CC;" @click="submit()">
			确认支付
		</button>
		<!-- <mix-button ref="confirmBtn" text="确认支付" marginTop="80rpx" @onConfirm="confirm"></mix-button> -->
		<!-- 支付成功面板 -->
		<!-- <success-modal ref="successModal" :price="data.pay_price" @onConfirm="successCallback"></success-modal> -->
		<!-- 支付密码键盘 -->
		<!-- <pay-password-keyboard ref="pwdKeyboard" @onConfirm="balancePay"></pay-password-keyboard> -->
		
		<!-- <mix-loading v-if="isLoading" :mask="true"></mix-loading> -->
		
		<!-- <mix-modal ref="mixModal" text="您还没有设置支付密码" confirmText="立即设置" @onConfirm="navTo('/pages/auth/payPassword')"></mix-modal> -->
	</view>
</template>

<script>
	
export default {
	data() {
		return {
			curType: 'wxpay',
			pay:{}
		}
	},
	onLoad(options) {
		uni.request({
			method:"GET",
			url:"http://121.5.53.212:3000/order",
			data:{
				id:options.id
			},
			success: (res) => {
				console.log(res)
				this.pay = res.data
			}
		})
	},
	methods:{
		submit(){
			uni.request({
				method:"PUT",
				url:"http://121.5.53.212:3000/order",
				data:{
					id:this.pay._id,
					state:"paid"
				},
				success: (res) => {
					console.log(res)
					uni.navigateTo({
						url:"/pages/order/list"
					})
				}
			})
		}
	}
	
}
</script>

<style scoped lang="scss">
	.app{
		padding: 0 80rpx;
		align-items: center;
		
		/deep/{
			.mix-btn-content{
				width: 560rpx;
			}
		}
	}
	.price-wrapper {
		background-color: #fff;
		height: 260rpx;
		font-size: 28rpx;
		color: #909399;
	
		.price{
			font-size: 56rpx;
			color: #333;
			margin-top: 20rpx;
			font-weight: 600;
			
			&:before{
				content: '￥';
				font-size: 40rpx;
			}
		}
	}
	.cell{
		width: 100%;
		height: 124rpx;
		
		.icon{
			width: 44rpx;
			height: 44rpx;
			margin-right: 32rpx;
		}
		.tit{
			flex: 1;
			font-size: 30rpx;
			color: #333;
			font-weight: 700;
		}
		.tip{
			margin-top: 14rpx;
			font-size: 24rpx;
			color: #999;
		}
		.icon-xuanzhong{
			font-size: 36rpx;
			color: $base-color;
		}
	}
	
</style>
