<template>
	<view class="app column">
		<!-- 顶部栏 -->
		<my-header></my-header>
		
		<view class="content row">
			<scroll-view class="left-side" scroll-y>
				<view 
				class="item center" 
				v-for="i in list"
				:class="{active:active.name==i.name}"
				@click="change(i)"
				>
					<text>{{i.name}}</text>
				</view>

			</scroll-view>
			<scroll-view class="right-side" scroll-y>
				<image class="cate-image" :src="'http://121.5.53.212:3000/'+active.img" mode="aspectFill"></image>
				<view class="wrap">
					<view class="item column" v-for="i in active.children" @click="jump(i)">
						<image class="icon" :src="'http://121.5.53.212:3000/'+i.img" mode="aspectFill"></image>
						<text class="tit">{{i.name}}</text>
					</view>
				</view>
			</scroll-view>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return{
				list:[],
				active:{}
			}
		},
		onShow(){
			uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/category",
				success: (res) => {
					console.log(res)
					let list = [];
					res.data.forEach((i,j,o)=>{
						if(i.parentCate=="顶级分类"){
							i.children = i.children || []
							o.forEach(k=>{
								if(k.parentCate == i.name){
									i.children.push(k)
								}
							})
							list.push(i)
						}
					})
					console.log(list)
					this.list = list;
					this.active = list[0]
				}
			})
		},
		methods:{
			jump(i){
				uni.navigateTo({
					url:"../list/list?name="+i.name+"&parentCate="+i.parentCate
				})
			},
			change(i){
				this.active = i
			}
		}
	}
</script>

<style>
	page{
		height: 100%;
	}
</style>
<style scoped lang="scss">
	.active{
		font-size: 28rpx;
		color:#ff536f;
		font-weight: 700;
		background-color: #fff;
		position: relative;
		
		&::before{
			content: '';
			position: absolute;
			left: 0;
			top: 30rpx;
			width: 6rpx;
			height: 30rpx;
			background-color: #ff536f;
			border-radius: 0 4rpx 4rpx 0;
		}
	}
	.app{
		height: 100%;
	}
	.content{
		flex: 1;
		padding-top: 12rpx;
		overflow: hidden;
		display: flex;
		margin-bottom: 100rpx;
	}
	.left-side{
		flex-shrink: 0;
		width: 180rpx;
		height: 100%;
		overflow-y: hidden;
		background-color: #f2f2f2;
		.item{
			height: 90rpx;
			line-height: 90rpx;
			font-size: 26rpx;
			color: #555;
			text-align: center;
		}
		.active{
			font-size: 28rpx;
			color: $base-color;
			font-weight: 700;
			background-color: #fff;
			position: relative;
			
			&::before{
				content: '';
				position: absolute;
				left: 0;
				top: 30rpx;
				width: 6rpx;
				height: 30rpx;
				background-color: $base-color;
				border-radius: 0 4rpx 4rpx 0;
			}
		}
	}
	.right-side{
		flex: 1;
		height: 100%;
		.cate-image{
			width: calc(100% - 40rpx);
			height: 200rpx;
			margin: 0 20rpx;
			border-radius: 8rpx;
		}
		.wrap{
			display: flex;
			flex-wrap: wrap;
			padding: 0 20rpx 20rpx;
		}
		.item{
			flex-shrink: 0;
			justify-content: flex-start;
			align-items: center;
			width: 30%;
			padding: 30rpx 0 0;
			display: flex;
			flex-direction: column;
			&:nth-child(3n-1){
				width: 40%;
			}
		}
		.icon{
			width: 108rpx;
			height: 108rpx;
			margin-bottom: 16rpx;
		}
		.tit{
			width: 140rpx;
			font-size: 24rpx;
			color: #333;
			text-align: center;
			line-height: 1.4;
		}
	}
</style>
