<template>
	<view class="empty">
		<image v-if="type=='default'" src="../static/empty/default.png" mode=""></image>
		<image v-else-if="type=='address'" src="../static/empty/address.png" mode=""></image>
		<image v-else-if="type=='cart'" src="../static/empty/cart.png" mode=""></image>
		<image v-else src="../static/empty/hamster.png" mode=""></image>
		<text style="padding-top: 20rpx;">{{txt}}</text>
	</view>
</template>

<script>
export default {
	props:{
		"type":{
			type:String,
			default:'default'
		},
		"txt":{
			type:String,
			default:"暂时没有数据"
		}
	}
}
</script>

<style lang="scss">
.empty {
	height:600rpx;
	width: 100%;
	background: #f6f6f6;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	color: #666;
}
</style>
