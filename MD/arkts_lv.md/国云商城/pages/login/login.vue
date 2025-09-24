<template>
	<view class="login">
		<view class="left-bottom-sign"></view>
		<view class="back-btn mix-icon icon-guanbi" @click="navBack"></view>
		<view class="right-top-sign"></view>
		<view class="agreement center">
			<text class="mix-icon icon-xuanzhong" :class="{active: agreement}"></text>
			<text @click="checkAgreement">请认真阅读并同意</text>
			<text class="tit">《用户服务协议》</text>
			<text class="tit">《隐私权政策》</text>
		</view>
		<view class="wrapper">
			<view class="left-top-sign">LOGIN</view>
			<view class="welcome">
				欢迎回来！
			</view>
			<view class="input-content">
				<view class="input-item">
					<text class="tit">手机号码</text>
					<view class="row">
						<input
							v-model="username"
							type="number" 
							maxlength="11"
							placeholder="请输入手机号码"
							placeholder-style="color: #909399"
						/>
					</view>
				</view>
				<view class="input-item">
					<text class="tit">验证码</text>
					<view class="row">
						<input
							v-model="code"
							type="number"
							maxlength="6"
							placeholder="请输入手机验证码"
							placeholder-style="color: #909399"
						/>
					<text
					class="getCode" 
					@click="getCode()"
					 >{{txt}}</text>	
					</view>
				</view>
			</view>
			<button marginTop="60rpx" @click="submit()">登录</button>

		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				agreement: true,
				username: '',
				code: '',
				txt:"获取验证码",
				second:60
			}
		},
		methods: {
			getCode(){
				if(this.username && this.second==60){
					uni.request({
						method:"GET",
						url:"http://121.5.53.212:3000/getCode",
						data:{
							username:this.username
						},
						success: (res) => {
							let timer = null;
							console.log(res)
							timer = setInterval(()=>{
								this.second--;
								this.txt = `重新获取 ${this.second} 秒`;
								if(!this.second){
									this.second = 60;
									clearInterval(timer);
									this.txt = "获取验证码"
								}
							},1000)
						}
					})
				}
			},
			submit(){
				uni.request({
					method:"POST",
					url:"http://121.5.53.212:3000/login",
					data:{
						username:this.username,
						code:this.code
					},
					success: (res) => {
						console.log(res)
						uni.setStorageSync("username",res.data)
						uni.switchTab({
							url:"/pages/user/user"
						})
					}
				})
			}
		}
	}
</script>

<style>
	page{
		background: #fff;
	}
</style>
<style scoped lang='scss'>
	.login{
		padding-top: 15vh;
		position:relative;
		width: 100vw;
		height: 100vh;
		overflow: hidden;
		background: #fff;
	}
	.wrapper{
		position:relative;
		z-index: 90;
		padding-bottom: 40rpx;
	}
	.back-btn{
		position:absolute;
		left: 20rpx;
		top: calc(var(--status-bar-height) + 20rpx);
		z-index: 90;
		padding: 20rpx;
		font-size: 32rpx;
		color: #606266;
	}
	.left-top-sign{
		font-size: 120rpx;
		color: #f8f8f8;
		position:relative;
		left: -12rpx;
	}
	.right-top-sign{
		position:absolute;
		top: 80rpx;
		right: -30rpx;
		z-index: 95;
		
		&:before, &:after{
			display:block;
			content:"";
			width: 400rpx;
			height: 80rpx;
			background: #b4f3e2;
		}
		&:before{
			transform: rotate(50deg);
			border-top-right-radius: 50px;
		}
		&:after{
			position: absolute;
			right: -198rpx;
			top: 0;
			transform: rotate(-50deg);
			border-top-left-radius: 50px;
		}
	}
	.left-bottom-sign{
		position:absolute;
		left: -270rpx;
		bottom: -320rpx;
		border: 100rpx solid #d0d1fd;
		border-radius: 50%;
		padding: 180rpx;
	}
	.welcome{
		position:relative;
		left: 50rpx;
		top: -90rpx;
		font-size: 46rpx;
		color: #555;
		text-shadow: 1px 0px 1px rgba(0,0,0,.3);
	}
	.input-content{
		padding: 0 60rpx;
	}
	.input-item{
		display:flex;
		flex-direction: column;
		align-items:flex-start;
		justify-content: center;
		padding: 0 30rpx;
		background: #f8f6fc;
		height: 120rpx;
		border-radius: 4px;
		margin-bottom: 50rpx;
		
		&:last-child{
			margin-bottom: 0;
		}
		.row{
			width: 100%;
		}
		.tit{
			height: 50rpx;
			line-height: 56rpx;
			font-size: 26rpx;
			color: #606266;
		}
		input{
			flex: 1;
			height: 60rpx;
			font-size: 30rpx;
			color: #303133;
			width: 100%;
		}	
	}
	/* 其他登录方式 */
	.other-wrapper{
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-top: 20rpx;
		margin-top: 80rpx;
		
		.line{
			margin-bottom: 40rpx;
			
			.tit{
				margin: 0 32rpx;
				font-size: 24rpx;
				color: #606266;
			}
			&:before, &:after{
				content: '';
				width: 160rpx;
				height: 0;
				border-top: 1px solid #e0e0e0;
			}
		}
		.item{
			font-size: 24rpx;
			color: #606266;
			background-color: #fff;
			border: 0;
			
			&:after{
				border: 0;
			}
		}
		.icon{
			width: 90rpx;
			height: 90rpx;
			margin: 0 24rpx 16rpx;
		}
	}
	.agreement{
		position: absolute;
		left: 0;
		bottom: 6vh;
		z-index: 1;
		width: 750rpx;
		height: 90rpx;
		font-size: 24rpx;
		color: #999;
		
		.mix-icon{
			font-size: 36rpx;
			color: #ccc;
			margin-right: 8rpx;
			margin-top: 1px;
			
			&.active{
				color: #ff55ff;
			}
		}
		.tit{
			color: #40a2ff;
		}
	}
</style>

