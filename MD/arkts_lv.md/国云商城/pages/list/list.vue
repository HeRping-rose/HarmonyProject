<template>
	<view class="product">
		<view style="position: fixed; top: 0; left: 0; width: 100%; z-index: 10000000; background: #fff;">
			<my-header :isList="true" v-model="flag"></my-header>
		</view>
		<view class="top">
		<view class="sort-bar">
			<view 
			class="item row center" 
			v-for="item in sort"
			:class="{active:item.name==cur.name}"
			@click="changeSort(item)"
			>
				<text>{{ item.name }}</text>
				<!-- <view v-if="item.isPrice" class="icon-wrap">
					<text class="mix-icon icon-down" :class="{active: item.type === 3}"></text>
					<text class="mix-icon icon-arrow-top" :class="{active: item.type === 4}"></text>
				</view> -->
			</view>
		</view>
		<!-- 商品分类 -->
		<scroll-view class="cate-bar b-b" scroll-x>
			<view class="cate-wrap row">
				<view class="fill-view"></view>
				<text 
				class="item" 
				v-for="i in cate"
				:class="{active:i.name==current}"
				@click="changeCate(i.name)"
				>
					{{i.name}}
				</text>
				<view class="fill-view"></view>
			</view>
		</scroll-view>
	</view>
	<view style="height: 200rpx ;"></view>
	<my-list :list="list" :flag="flag"></my-list>
	</view>
</template>

<script>
export default {
	data(){
		return {
			flag:true,
			sort:[
				{name:"综合排序",type:1,isPrice:false},
				{name:"销量",type:2,isPrice:false},
				{name:"价格",type:3,isPrice:true},
				{name:"好评率",type:5,isPrice:false}
			],
			cur:{name:"综合排序",type:1,isPrice:false},
			list:[],
			cate:[],
			current:this.$route.query.name
		}
	},
	onShow() {
		this.getData()
		uni.request({
			method:"GET",
			url:"http://121.5.53.212:3000/category",
			data:{
				parentCate:this.$route.query.parentCate
			},
			success: (res) => {
				console.log(res)
				this.cate =res.data;
			}
		})
	},
	methods:{
		changeSort(item){
			this.cur = item;
			if(item.type==1){
				this.list.forEach(i=>{
					i.sort = (i.sales*0.5)+(i.views/1000*0.2)+(i.hot*5*0.1)+((1-i.price/i.originalPrice)*0.1)
				})
				this.list.sort((a,b)=>b.sort-a.sort)
				console.log(this.list)
			}
			if(item.type==2){
				//xxxx
			}
			if(item.type==3){
				this.list.sort((a,b)=>a.price-b.price)
				item.type=4;
				
			}else if(item.type==4){
				this.list.sort((a,b)=>b.price-a.price)
				item.type=3;
				
			}
		},
		getData(){
			uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/list",
				data:{
					name:this.current,
					keyword:this.$route.query.keyword
				},
				success: (res) => {
					console.log(res,1123123)
					this.list =res.data;
				}
			})
		},
		changeCate(name){
			this.current = name;
			this.getData()
			this.cur={name:"综合排序",type:1,isPrice:false}
		}
	}
}
</script>

<style scoped lang="scss">
	.product {
		.sort-bar {
			display: flex;
			justify-content: center;
			text-align: center;
			align-items: center;
			height: 76rpx;
			padding: 4rpx 0 4rpx 4rpx;
			padding-left: 10rpx;
			background-color: #fff;
			position: relative;
			z-index: 1;
			.item {
				display: flex;
				justify-content: center;
				align-items: center;
				flex: 1;
				height: 75%;
				font-size: 28rpx;
				color: #333;
				position: relative;
				overflow: hidden;
				&.active {
					color: #FF536F;
					font-weight: 700;
					&:after {
						position: absolute;
						left: 50%;
						bottom: 0;
						transform: translateX(-28rpx);
						content: '';
						width: 56rpx;
						height: 4rpx;
						background-color: #FF536F;
						border-radius: 10px;
					}
					.mix-icon.active {
						color: #007AFF;
					}
				}
				/* #ifdef MP */
				&.last:before{
					content: '';
					position: absolute;
					right: 0;
					top: 50%;
					transform: translateY(-50%);
					width: 2rpx;
					height: 40rpx;
					box-shadow: 0 0 16rpx rgba(0,0,0,.6);
				}
				/* #endif */
			}
			.icon-wrap {
				display: flex;
				flex-direction: column;
				padding-left: 8rpx;
			}
			.mix-icon {
				font-size: 14rpx;
				color: #bbb;
			}
			.btn {
				height: 68rpx;
				padding-left: 16rpx;
				padding-right: 20rpx;

				.icon-hengxiangliebiao,
				.icon-shuxiangliebiao {
					font-size: 40rpx;
					color: #333;
				}
			}
		}
		.cate-bar:after {
			border-color: #f5f5f5;
		}
		.cate-wrap {
			height: 96rpx;
			padding-bottom: 4rpx;
			align-items: center;
			padding-left: 10rpx;
			display: flex;
			.fill-view {
				flex-shrink: 0;
				&:last-child {
					width: 10rpx;
				}
			}
			.item {
				padding: 0 28rpx;
				margin-right: 20rpx;
				font-size: 22rpx;
				color: #333;
				height: 60rpx;
				text-align: center;
				line-height: 58rpx;
				background-color: #f5f5f5;
				border-radius: 100px;
			}

			.active {
				color: #FF536F;
				background-color: #fff8f4;
				font-weight: 700;
			}
		}
		.top {
			position: fixed;
			left: 0;
			top: 80rpx;
			width: 100%;
			z-index: 95;
			background-color: #fff;

		}
		.cate-wrap{
			display: flex;
			height: 85rpx !important;
			//不换行
			white-space: nowrap;
			//横向滑动
			overflow-x: scroll;
			//滚动条消失
			&::-webkit-scrollbar {
				display: none;
			} 
			.fill-view{
				flex-shrink: 0;
				width: 20rpx;
				height: 20rpx;
				
				&:last-child{
					width: 10rpx;
				}
			}
			.item{
				flex-shrink: 0;
				height: 58rpx;
				padding: 0 28rpx;
				margin-right: 20rpx;
				font-size: 22rpx;
				color: #333;
				text-align: center;
				line-height: 58rpx;
				background-color: #f5f5f5;
				border-radius: 100px;
			}
			.active{
				color:  #ff007f;
				background-color: #fff8f4;
				font-weight: 700;
			}
		}
		.main {
			margin-top: 240rpx;
			.gongsi {
				margin-top: 40rpx;
				margin-bottom: 20rpx;
				display: flex;
				justify-content: center;
				align-items: center;
				width: 100%;
				color: #999;
				font-size: 26rpx;
				image {
					width: 34rpx;
					height: 34rpx;
					margin: 10rpx;
				}
			}
		}
	}	
</style>