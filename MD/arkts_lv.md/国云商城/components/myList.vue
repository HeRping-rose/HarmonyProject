<template>
	<view :class="flag?'list':'list2'">
		<view v-for="i in list" class="item" @click="jump(i._id)">
			<view class="list_img">
				<image :src="'http://121.5.53.212:3000/'+i.img"></image>
			</view>
			<view class="list_title">
				<text>{{i.name}}</text>
			</view>
			<view class="list_price">
				<text class="t1">￥{{i.originalPrice}}</text>
				<text class="t2">{{i.price!=null?"￥"+i.price:""}}</text>
				<text class="t3">免运费</text>
			</view>
		</view>
		<view style="height: 150rpx;">123</view>
		<my-empty v-if="!list.length"></my-empty>
	</view>
</template>

<script>
export default {
	props:{
		"list":{type:Array},
		"flag":{
			type:Boolean,
			default:true
		}
	},
	methods:{
		jump(_id){
			uni.navigateTo({
				url:"/pages/detail/detail?_id="+_id
			})
		}
	}
}
</script>

<style lang="scss">
/* 商品列表 */
.list{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background: #f7f7f7;
	padding: 0 20rpx;
	.item{
		width: 348rpx;
		height: 550rpx;
		margin-bottom: 15rpx;
		background: white;
		border-radius: 10rpx;
		.list_img{
			height: 380rpx;
			image{
				width: 100%;
				height: 100%;
			}
		}
		.list_title{
			font-size: 28rpx;
			padding: 15rpx;
			padding-bottom: 0;
			display: -webkit-box;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 2;
			overflow: hidden;

		}
		.list_price{
			display: flex;
			margin-top: 20rpx;
			padding-left: 10rpx;
			.t1{
				color: #ff536f;
				flex: 1;
			}
			.t2{
				color: #ccc;
				flex: 3;
				font-size: 22rpx;
				padding-top: 5rpx;
				margin-left: 10rpx;
				text-decoration:line-through;
			}
			.t3{
				width: 90rpx;
				height: 33rpx;
				background: #ff536f;
				color: white;
				font-size: 22rpx;
				text-align: center;
				border-radius: 5rpx;
				margin: 3rpx 10rpx 0 0;
			}
		}
	}
}

.list2{
	background: #f7f7f7;
	padding: 0 20rpx;
	
	.item{
		display: flex;
		width: 100%;
		height: 300rpx;
		margin-bottom: 5rpx;
		background: white;
		border-radius: 10rpx;
		align-items: center;
		// flex-wrap: wrap;
		
		.list_img{
			height: 222rpx;
			width: 220rpx;
			
			image{
				width: 100%;
				height: 100%;
			}
		}
		.list_title{
			width: 520rpx;

		}
		.list_price{
			// display: flex;
			// margin-top: 20rpx;
			// padding-left: 10rpx;
			// .t1{
			// 	color: #ff536f;
			// 	flex: 1;
			// }
			// .t2{
			// 	color: #ccc;
			// 	flex: 3;
			// 	font-size: 22rpx;
			// 	padding-top: 5rpx;
			// 	margin-left: 10rpx;
			// 	text-decoration:line-through;
			// }
			// .t3{
			// 	width: 90rpx;
			// 	height: 33rpx;
			// 	background: #ff536f;
			// 	color: white;
			// 	font-size: 22rpx;
			// 	text-align: center;
			// 	border-radius: 5rpx;
			// 	margin: 3rpx 10rpx 0 0;
			// }
		}
	}
}
</style>
