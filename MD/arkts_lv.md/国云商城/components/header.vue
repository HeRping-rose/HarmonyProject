<template>
	<view class="header">
		<view class="icon" v-if="isList" @click="$router.back()">
			<text class="iconfont icon-fanhui"></text>
		</view>
		<view class="icon" v-else>
			<text class="iconfont icon-xiaoxi"></text>
		</view>
		<view 
		class="center" 
		@click="jump()"
		:style="{justifyContent:$route.query.keyword?'flex-start':'center'}"
		>
			<text class="icon2 iconfont icon-sousuo"></text>
			<text 
			class="keyword" v-if="$route.query.keyword"
			@click.stop="$router.go(-2)"
			>
			{{$route.query.keyword}}</text>
			<text v-else>输入关键字搜索</text>
		</view>
		<view class="icon" v-if="isList" @click="$emit('input',!value)">
			<text v-if="value" class="iconfont icon-act_liebiaozongxiang"></text>
			<text v-else class="iconfont icon-act_liebiaohengxiang"></text>
		</view>
		<view class="icon" v-else @click="switchTo('/pages/user/user')">
			<text class="iconfont icon-saoma"></text>
		</view>
	</view>
</template>

<script>
export default {
	props:{
		value:{
			type:Boolean,
			default:true
		},
		isList:{
			type:Boolean,
			default:false
		}
	},
	methods:{
		jump(){
			uni.navigateTo({
				url:"/pages/search/search"
			})
		}
	}
}
</script>

<style scoped lang="scss">

.header {
	display: flex;
	height: 80rpx;
	align-items: center;
	margin-bottom: 10rpx;
	
	.icon {
		width: 60rpx;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.center {
		flex: 1;
		height: 60rpx;
		background: #e9e8ec;
		border-radius: 30rpx;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 28rpx;
		
		.icon2 {
			font-size: 33rpx;
		}
		
		.keyword {
			font-size: 24rpx;
			padding: 5rpx 20rpx;
			border-radius: 20rpx;
			background: #888;
			color: #fff;
			padding-right: 30rpx;
			position: relative;
			
			&::after {
				content: "x";
				position: absolute;
				right: 10rpx;
				top: 5rpx;
			}
		}
	}
}
</style>
