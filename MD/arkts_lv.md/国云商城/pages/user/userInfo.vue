<template>
	<view class="app">
		<view class="cell">
			<text class="tit fill">头像</text>
			<view class="avatar-wrap">
				<image 
				@click="chooseImg()"
				class="avatar" 
				:src="(user.avatar&&URL + user.avatar) || temp ||'../../static/icon/default-avatar.png'"
				mode="aspectFill"
				>
				</image>
			</view>
		</view>
		<view class="cell b-b">
			<text class="tit fill">昵称</text>
			<input class="input" v-model="user.nickName" type="text" maxlength="8" placeholder="请输入昵称" placeholder-class="placeholder">
		</view>
		<view class="cell b-b">
			<text class="tit fill">性别</text>
			<radio-group @change="radioChange">
			<view class="checkbox center">
				<radio value="男" checked></radio>
				<text>男</text>
			</view>
			<view class="checkbox center">
				<radio value="女"></radio>
				<text>女</text>
			</view>
			</radio-group>
		</view>
		<view class="cell b-b">
			<text class="tit">公开信息</text>
			<text class="tip fill">评价、晒单等</text>
			<switch color="#FF536F" checked @change="switch2Change" />
		</view>
		
		<button @click="submit()">保存资料</button>
	</view>
</template>

<script>
	export default {
		data(){
			return {
				user:{},
				temp:""
			}
		},
		onShow() {
			let username = uni.getStorageSync("username")
				uni.request({
				method:"GET",
				url:"http://121.5.53.212:3000/user",
				data:{
					username
				},
				success: (res) => {
					console.log(res)
					this.user = res.data
				}
			})
		},
		methods:{
			submit(){
				uni.request({
					method:"PUT",
					url:"http://121.5.53.212:3000/user",
					data:this.user,
					success: (res) => {
						console.log(res)
						this.switchTo("./user")
					}
				})
			},
			switch2Change(e){
				console.log(e)
				this.user.publishInfo = e.detail.value;
			},
			radioChange(e){
				console.log(e)
				this.user.sex = e.detail.value;
			},
			chooseImg(){
				uni.chooseImage({
				    count: 1, //默认9
				    sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
				    sourceType: ['album'], //从相册选择
				    success: (chooseImageRes)=> {
				        const tempFilePaths = chooseImageRes.tempFilePaths;
						this.temp = tempFilePaths[0]
				               uni.uploadFile({
				                   url: 'http://121.5.53.212:3000/upload', //仅为示例，非真实的接口地址
				                   filePath: tempFilePaths[0],
				                   name: 'file',
				                   success: (uploadFileRes) => {
				                       console.log(uploadFileRes.data);
									   this.user.avatar = uploadFileRes.data
				                   }
				               });
				    }
				});
			}
		}
	}
</script>

<style scoped lang="scss">
	.app{
		padding-top: 16rpx;
	}
	.cell{
		display: flex;
		align-items: center;
		min-height: 110rpx;
		padding: 0 40rpx;
		
		&:first-child{
			margin-bottom: 10rpx;
		}
		&:after{
			left: 40rpx;
			right: 40rpx;
			border-color: #d8d8d8;
		}
		.tit{
			font-size: 30rpx;
			color: #333;
		}
		.avatar-wrap{
			width: 120rpx;
			height: 120rpx;
			position: relative;
			border-radius: 100rpx;
			overflow: hidden;
			
			.avatar{
				width: 100%;
				height: 100%;
				border-radius: 100rpx;
			}
			.progress{
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
				width: 100rpx;
				height: 100rpx;
				box-shadow: rgba(0,0,0,.6) 0px 0px 0px 2005px;
				border-radius: 100rpx;
				transition: .5s;
				opacity: 0;
				
				&.no-transtion{
					transition: 0s;
				}
				&.show{
					opacity: 1;
				}
			}
		}
		.input{
			flex: 1;
			text-align: right;
			font-size: 28rpx;
			color: #333;
		}
		switch{
			margin: 0;
			transform: scale(0.8) translateX(10rpx);
			transform-origin: center right;
		}
		.tip{
			margin-left: 20rpx;
			font-size: 28rpx;
			color: #999;
		}
		.checkbox{
			padding: 12rpx 0 12rpx 40rpx;
			font-size: 28rpx;
			color: #333;
			
			.mix-icon{
				margin-right: 12rpx;
				font-size: 36rpx;
				color: #ccc;
			}
			.icon-xuanzhong{
				color: #ff007f;
			}
		}
	}
</style>
