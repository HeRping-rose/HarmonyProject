<template>
	<view class="addmanage">
		<view class="cell row b-b">
			<text class="tit">收货人</text>
			<input class="input" v-model="consignee" type="text" maxlength="10"  placeholder="请输入收货人姓名" placeholder-class="placeholder" />
		</view>
		<view class="cell row b-b">
			<text class="tit">手机号</text>
			<input class="input" v-model="phone" type="text" maxlength="10"  placeholder="请输入收货人手机号码" placeholder-class="placeholder" />
		</view>
		<view class="cell row b-b">
			<text class="tit">地址</text>
			<view style="font-size: 26rpx;" @click="navTo('/pages/chooseAddress/index')">
				<text v-if="address">{{address}}</text>
				<text v-else>请在地图选择收货地址</text>
			</view>
		<text class="mix-icon icon-you"></text>
		</view>
		<view class="cell row b-b">
			<text class="tit fill">设为默认地址</text>
			<switch @change="switch1Change" color="#FF536F" />
		</view>
		<button style="margin:30rpx 0; " @click="submit()">添加</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				address:"",
				consignee:"",
				phone:"",
				normal:false
			}
		},
		onShow() {
			this.address = uni.getStorageSync("address")
		},
		methods: {
			switch1Change: function (e) {
			      this.normal =  e.target.value
			 },
			 submit(){
				 let obj = {
					address:this.address,
					consignee:this.consignee,
					phone:this.phone,
					normal:this.normal,
					user:uni.getStorageSync("user")||"小明"
				 }
				 uni.request({
				 	method:"POST",
					url:"http://121.5.53.212:3000/address",
					data:obj,
					success: (res) => {
						console.log(res)
						uni.navigateTo({
							url:"/pages/address/address"
						})
					}
				 })
			 }
		}
	}
</script>

<style  scoped lang="scss">
	page{
		background-color:#fff;
	}
	.addmanage{
		height: 100%;
		width: 100%;
		padding: 10rpx 44rpx 0;
	}
	.cell{
		height: 106rpx;
		
		.tit{
			min-width: 130rpx;
			font-size: 30rpx;
			color: #333;
		}
		.input{
			flex: 1;
			font-size: 30rpx;
			color: #333;
		}
		.icon-you{
			flex-shrink: 0;
			margin-right: 8rpx;
			margin-left: 40rpx;
			font-size: 24rpx;
			color: #aaa;
		}
		switch{
			transform: scale(0.8) translateX(10rpx);
			transform-origin: center right;
		}
	}

</style>
