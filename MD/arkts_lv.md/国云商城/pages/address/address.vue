<template>
	<view class="address">
		<my-empty v-if="address.length==0" type="address" txt="找不到您的收货地址哦，先去添加一个吧~"></my-empty>
		<view v-else class="list" v-for="i in address" @click="jump(i)">
			<view class="list-item">
				<text class="tite">
				{{i.consignee}}
				</text>
				<text class="tel">
				{{i.phone}}
				</text>
				<text class="default" v-if="i.normal">
				默认
				</text>
				<view class="txt">
					{{i.address}}
				</view>
			</view>
			<view class="bottom">
			<text class="mix-icon icon-lajitong"></text>
			<text>删除</text>
			<text class="mix-icon icon-bianji"></text>
			<text>编辑</text>
			</view>
		</view>
		
		<view class="btn" @click="navTo('/pages/address/addmanage')">
			 <button>+新增收货地址</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				address:[]
			}
		},
		onShow() {
			uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/address",
				data:{
					user:uni.getStorageSync("user")||"小明"
				},
				success: (res) => {
					console.log(res)
					this.address = res.data
				}
			})
		},
		methods:{
			jump(i){
				uni.setStorageSync("currentAddress",i)
				uni.navigateTo({
					url:"/pages/order/order"
				})
			}
		}
	}
</script>

<style lang="scss">
	page{
		background-color:#F0F0F0  !important;
	}
	.address{
	
	.list{
		border-radius: 10rpx;
		font-size: 30rpx;
		margin: 20rpx;
		
		background:#fff;
		.list-item{
			padding: 20rpx;
			.tel{
			
				color: #878787;
				margin: 0 20rpx;
			}
			.default{
				color: #fff;
				font-size:16rpx;
				padding:0 5rpx;
				background: #ff536f;
			}
			.txt{
				margin: 20rpx 0 30rpx;
				color: #878787;
				font-size:30rpx;
			}
		}
		.bottom{
		text-align: right;
		 font-size:26rpx;
		 border-top: 5rpx solid #FAFAFA;
		 padding: 20rpx;
		 text{
			 margin:0 10rpx;
		 }
		}
		
		
	}
	
		.btn{
			width: 100%;
			text-align: center;
	        position: fixed;
	       bottom:30rpx;
		}
		
	}

</style>
