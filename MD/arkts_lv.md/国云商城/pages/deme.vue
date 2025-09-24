<template>
	<view class="dome">
		<view class="box">
			<view class="chou" v-for="(i,index) in list" :key="index">
				<view class="item" :class="{'on':index==rollIndex,'pre':index==rollIndex-1&&flag,'prepre':index==rollIndex-2&&flag}" >{{i.title}}</view>

				</view>
				<text class="start" @click="start()">抽偶像</text>
		</view>
	</view>
	
</template>
<script>
	export default{
		data(){
			return{
			flag:false,
			winner:0,   //指定获奖下标， specified为true是生效
			specified:false,   //是否指定获奖结果，false时为随机
			rollIndex:-1  ,//转动时的下表位置
			prize:-1,   //这是中奖位置
			count:8, //总共有多少位置
			speed:100,  //初始转动速度
			cycle:40, //转动基本次数，及至少需要转动多少次再次进入抽奖环节
			rolling:false, //是否处于抽奖状态, 防止多次点击
			timer:null,  //每次转动定时器
			times:0,   //转动次数
			list:[
				{title:'肖战'},
				{title:'王一博'},
				{title:'罗云熙'},
				{title:'易烊千玺'},
				{title:'王俊凯'},
				{title:'张艺兴'},
				{title:'邓孝慈'},
				{title:'刘昊然'},
			]
			
			}
			},
			methods:{
			start(){
				if(!this.rolling){  // 是否处于抽奖状态, 防止多次点击
					this.startRoll()
				}
			},
			
			
			// 开始转动方法
			startRoll(){
			this.rolling=true  //开始转动状态
			this.times+=1  //转动次数
			this.oneRoll()  //转动过程调用的每一次转动方法，这个是第一次调用初始化
			
			// 如果当前转动次数达到要求&&目前转动的位置是中奖位置
			if(this.prize==this.rollIndex&&this.speed>340){
				clearTimeout(this.timer)  //清除定时器，停止转动
			//初始化相关数据
			this.times=null;//$options:选项，他可以获取data外面的数据和方法
			// 更详细来说在data外面定义的属性和方法可以通过$options来获取和调用
			this.speed=100;  //上面data里 定义的：speed:100, 初始转动速度
			// this.prize=this.$options.data().prize
			this.flag = false;
		setTimeout(res=>{
			this.rolling=false
			alert(`哇，你抽中了${this.list[this.rollIndex].title}`)
		},500)
			}else{
				this.flag = true;
				if(this.times<this.cycle){
					this.speed-=10 //加快转动速度
				}else if(this.times===this.cycle){
		    //当转动次数达到规定的，必要转动次数后，开始确定中奖位置
			// 判断是否指定获奖结果，上面定义的，false时为随机
			if(this.specified){
				this.prize=this.winner
				}else{
					// const：es6常量关键字
					const index=this.random(0,this.count-1) // 随机获得一个中奖位置
					this.prize=index //中奖位置，可由后台返回
					console.log(this.prize)
				}
				}else{
					// 当转动次数times>cycle规定停止的转次时，开始慢慢减速，直到达到指定的中奖位置
					this.speed += this.rollIndex + this.timer%30
				}
				//当转速达到一定高度时，就固定为50ms/转
				if(this.speed<50){
					this.speed=50
				}
	
				this.timer=setTimeout(this.startRoll,this.speed)
					}
			},
			
			// 每一次转动
			oneRoll(){
				let index=this.rollIndex   //当前转动到那个位置
				const count=this.count   //总共有多少个位置count：计数
				index+=1
				if(index>count-1){
				index=0
				}
				this.rollIndex=index
			},
			random(min,max){ 
          return  parseInt(Math.random() * (max-min+1)+min)
			}
			
	}
	
	
	}
	
</script>

<style lang="scss">
	// 全局变量
	$chou_w:5rem;
	$chou_h:5rem;
	$chou_margin:.5rem;
	
	.box{
		margin: 50rpx auto;
		position: relative;
		background: pink;
		width: $chou_w*3;
		height: $chou_h*3;
		
		// 抽奖按钮
		.start{
		width: $chou_w - $chou_margin*2;
	    height: $chou_h - $chou_margin*2;
		background: #DD524D;
		position: absolute;
		top:$chou_h+$chou_margin;
		left: $chou_w+$chou_margin;
		border-radius: 50%;
		display: flex;
		justify-content: center;
		align-items: center;
		color: #fff;
		}
		
		// 每个奖品的外层样式，就是周围的八个小方框
		.chou{
			width: $chou_w;
			height: $chou_h;
			background:rgb(8,230,218);
			border-radius: .6rem;
			box-sizing: border-box;
			position: absolute;
			left: 0;
			top: 0;
			display: flex;
			justify-content: center;
			padding: $chou_margin;
			
			.item{
				width: 100%;
				height: 100%;
				display: flex;
				justify-content: center;
				align-items: center;
				box-sizing: border-box;
				border-radius: .6rem;
				box-shadow: 0 0 5rpx #ccc;
				background: #C8C7CC;
				
				&.on{
					background: pink;
					color:#fff;
					font-weight: bold;
					
				}
				&.pre{
					background: #f1d9de;
					color:#eee;
					font-weight: bold;
					
				}
				&.prepre{
					background: #e0d8d9;
					color:#eee;
					font-weight: bold;
					
				}
			}
			
			}
			
			// 针对每个奖品单独调整位置，以便适用于跑马灯的效果，就是其他八个位子的样式，给他定位，设置颜色啥的，
			.chou:nth-child(1){
				left: 0;
				top: 0;
			}
			
			.chou:nth-child(2){
				left:$chou_w;
				top:  0*$chou_h;
			}
	   .chou:nth-child(3){
	   top: 0*$chou_h;
	   left: 2*$chou_w;
	   }
	   .chou:nth-child(4){
	   top: 1*$chou_h;
	   left: 2*$chou_w;
	   }
	   .chou:nth-child(5){
	   top: 2*$chou_h;
	   left: 2*$chou_w;
	   }
	   .chou:nth-child(6){
	   top: 2*$chou_h;
	   left: 1*$chou_w;
	   }
	   .chou:nth-child(7){
	   top: 2*$chou_h;
	   left: 0*$chou_w;
	   }
	   .chou:nth-child(8){
	   top: 1*$chou_h;
	   left: 0*$chou_w;
	   }
	}
</style>
