<template>
	<view class="shopcar">
		<!-- 列表 -->
	<view class="list">
	<view class="item row" v-for="i in cart">
		<text 
		class="icon-xuanzhong iconfont icon-2xuanzhong" 
		@click="changeChoose(i._id)"
		:class="{active:current.includes(i._id)}"
		></text>
		<view class="img lazyload lazypic">
		<image :src="'http://121.5.53.212:3000/'+i.pic"></image>
		</view>
		<view class="right column">
			<view class="content">
				<text class="title clamp">{{i.name}}</text>
				<text class="sku">{{i.size}}</text>
				<text class="price">¥{{i.price}}</text>
			</view>
			<view class="number">
				<button class="btn1" @click="i.count>1&&i.count--">-</button>
				<input type="text" v-model="i.count" />
				<button class="btn2" @click="i.count<10&&i.count++">+</button>
			</view>
				</view>
			</view>
		</view>
		<view class="bottom">
			<text 
			class="icon-xuanzhong iconfont icon-2xuanzhong" 
			:class="{active:current.length==cart.length && cart.length}"
			@click="changeAll()"
			></text>
			<text v-if="current.length!=cart.length" class="check-tip">全选</text>
			<view 
			class="del-btn center" 
			:class="{active: current.length==cart.length && cart.length}"
			>
				<text>清空</text>
			</view>
			<text class="price fill">￥{{total}}</text>
			<view class="btn center" @click="pay()">
				<text>去结算</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data(){
			return {
				cart:[],
				current:[]
			}
		},
		computed:{
			total(){
				return this.cart
				.filter(i=>this.current.includes(i._id))
				.reduce((t,j)=>t+=j.count*j.price,0)
			}
		},
		onShow(){
			let user = uni.getStorageSync("user") || "小明"
			uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/cart",
				data:{
					user
				},
				success: (res) => {
					console.log(res)
					this.cart = res.data
				}
			})
		},
		methods:{
			pay(){
				let data = this.cart.filter(i=>this.current.includes(i._id))
				console.log(data)
				if(data.length){
					uni.setStorageSync("order",data)
					uni.navigateTo({
						url:"/pages/order/order"
					})
				}else{
					uni.showToast({
						title:"请选择要购买的商品",
						icon:"none"
					})
				}
			},
			changeAll(){
				if(this.current.length==this.cart.length && this.cart.length){
					this.current = []
				}else{
					this.current = this.cart.map(i=>i._id)
				}
			},
			changeChoose(id){
				console.log(id)
				let index = this.current.indexOf(id)
				if(index>-1){
					this.current.splice(index,1)
				}else{
					this.current.push(id)
				}
			}
		}
	}
</script>

<style lang="scss" scoped>
	page{
		background-color:#fff;
	}
.shopcar {
	.header{
		font-size:34rpx;
		width: 100%;
		height:80rpx;
	    font-weight: bold;
		line-height:80rpx;
		text-align: center;
	}
	
.list{

	.item{
		position:relative;
		margin: 20rpx 0;
		display: flex;
	}
	
	.icon-xuanzhong{
		padding: 60rpx 20rpx;
		font-size: 36rpx;
		color: #ddd;
		
		&.active{
			color: #ff007f;
		}
	}
	.right{
		flex: 1;
		overflow: hidden;
		
	
			
			text {
				display: block;
			}
		
	}
	.title{
		font-size: 30rpx;
		line-height: 42rpx;
	}
	.sku{
		min-height: 20rpx;
		margin: 20rpx 0 28rpx;
		font-size: 24rpx;
		color: #999;
	}
	.price{
		margin-bottom: 4rpx;
		font-size: 30rpx;
		color: #333;
	}

		.img{
			flex-shrink: 0;
			width: 170rpx;
			height:170rpx;
			margin-right: 20rpx;
			border-radius: 10rpx;
			overflow: hidden;
			
			image{
				width: 100%;
				height: 100%;
			}
		}
	.number{
		display:flex;
		position: absolute;
		right: 0rpx;
		bottom:0rpx;
		padding: 20rpx 30rpx 0;
		
		button{
			background:#F0F0F0 !important;
			width:45rpx;
			height: 45rpx;
			line-height:45rpx;
			border-radius: 0;
		}
		.btn1{
			
			border-top-left-radius:10rpx;
			border-bottom-left-radius:10rpx;
		}
		.btn2{
			border-top-right-radius:10rpx;
			border-bottom-right-radius:10rpx;
		}
		input{
			text-align: center;
			width: 80rpx;
			height:45rpx;
			border:0.5rpx solid #F0F0F0;
		}
	}
	}
	.bottom{
		align-items: center;
		display: flex;
		justify-content: space-between;
	   position: fixed;
	   left: 0;
	   bottom: var(--window-bottom);
	   z-index: 90;
	   width: 100%;
	   height: 100rpx;
	   background-color: #fff;
	   box-shadow: 0 -2rpx 10rpx 0 rgba(0,0,0,.06);
	   box-sizing: content-box;
	   padding-bottom: constant(safe-area-inset-bottom);
	   padding-bottom: env(safe-area-inset-bottom); 

		.icon-xuanzhong{
			margin-left: 20rpx;
			font-size: 48rpx;
			color: #ddd;
			position: relative;
			z-index: 10;
			background-color: #fff;
			border-radius: 100rpx;
			
			&.active{
				color: #ff007f;
			}
		}
		.check-tip{
			position: absolute;
			left: 80rpx;
			font-size: 28rpx;
			color: #333;
		}
		.del-btn{
			width: 0rpx;
			height: 44rpx;
			padding-left: 14rpx;
			font-size: 28rpx;
			color: #fff;
			background-color: #C0C4CC;
			border-radius: 0 100rpx 100rpx 0;
			position: relative;
			left: -24rpx;
			transition: width .2s;
			
			&.active{
				width: 110rpx;
			}
		}
		.price{
			margin-right: 30rpx;
			font-size: 34rpx;
			color:#ff007f;
			font-weight: 700;
			text-align: right;
		}
		.btn{
			text-align: center;
			min-width: 180rpx;
			line-height: 70rpx;
			height: 70rpx;
			padding: 0 26rpx;
			margin-right: 20rpx;
			border-radius: 100rpx;
			background-color:#ff007f;
			font-size: 30rpx;
			color: #fff;
		}
	}
}
</style>
