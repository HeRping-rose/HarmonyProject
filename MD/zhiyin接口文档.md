## 二、用户模块

### 1. 用户注册

- **URL**：`POST /user/register/`
- **请求参数**：

```
{
  "username": "test_user",
  "password": "123456",
  "email": "test@example.com"
}
```

- **返回示例**：

```
{
  "code": 200,
  "msg": "注册成功",
  "data": {
    "user_id": 1,
    "username": "test_user",
    "email": "test@example.com"
  }
}
```

------

### 2. 用户登录

- **URL**：`POST /user/login/`
- **请求参数**：

```
{
  "username": "test_user",
  "password": "123456"
}
```

- **返回示例**：

```
{
  "code": 200,
  "msg": "登录成功",
  "token": "eyJhbGciOiJIUzI1NiIs..."
}
```

------

### 3. 获取用户信息

- **URL**：`GET /user/profile/`
- **请求头**：`Authorization: Bearer <token>`
- **返回示例**：

```
{
  "code": 200,
  "msg": "success",
  "data": {
    "user_id": 1,
    "username": "test_user",
    "email": "test@example.com"
  }
}
```

------

## 三、播客节目模块

### 1. 获取播客列表

- **URL**：`GET /podcast/list/?page=1&size=10`
- **返回示例**：

```
{
  "code": 200,
  "msg": "success",
  "data": [
    {
      "id": 101,
      "title": "知乎热榜",
      "author": "小张",
      "cover": "http://localhost:8000/media/podcast101.jpg",
      "duration": 3600,
      "create_time": "2024-08-15 21:49:48"
    }
  ]
}
```

------

### 2. 获取播客详情

- **URL**：`GET /podcast/detail/{id}/`
- **返回示例**：

```
{
  "code": 200,
  "msg": "success",
  "data": {
    "id": 101,
    "title": "知乎热榜",
    "author": "小张",
    "description": "本期讨论知乎热榜的热门话题。",
    "cover": "http://localhost:8000/media/podcast101.jpg",
    "audio_url": "http://localhost:8000/media/audio101.mp3",
    "duration": 3600,
    "create_time": "2024-08-15 21:49:48"
  }
}
```

------

## 四、播放记录

### 1. 添加播放记录

- **URL**：`POST /play/history/`
- **请求参数**：

```
{
  "podcast_id": 101,
  "progress": 120
}
```

- **返回示例**：

```
{
  "code": 200,
  "msg": "播放进度已保存"
}
```

------

### 2. 获取播放历史

- **URL**：`GET /play/history/?page=1&size=10`
- **返回示例**：

```
{
  "code": 200,
  "msg": "success",
  "data": [
    {
      "id": 1,
      "podcast_id": 101,
      "title": "知乎热榜",
      "progress": 120,
      "last_play_time": "2024-08-15 21:49:48"
    }
  ]
}
```

------

## 五、评论模块

### 1. 发表评论

- **URL**：`POST /comment/add/`
- **请求参数**：

```
{
  "podcast_id": 101,
  "content": "这一期讲得很好！"
}
```

- **返回示例**：

```
{
  "code": 200,
  "msg": "评论成功",
  "data": {
    "comment_id": 1,
    "user": "test_user",
    "content": "这一期讲得很好！",
    "create_time": "2024-08-15 22:00:00"
  }
}
```

------

### 2. 获取评论列表

- **URL**：`GET /comment/list/{podcast_id}/?page=1&size=10`
- **返回示例**：

```
{
  "code": 200,
  "msg": "success",
  "data": [
    {
      "comment_id": 1,
      "user": "test_user",
      "content": "这一期讲得很好！",
      "create_time": "2024-08-15 22:00:00"
    }
  ]
}
```

------

## 六、错误返回格式

所有接口错误时统一返回：

```
{
  "code": 400,
  "msg": "错误信息描述"
}
```

------

## 七、前端调用示例（ArkTS 请求示例）

```
import http from '@ohos.net.http';

let httpRequest = http.createHttp();

// 例：获取播客列表
httpRequest.request(
  "http://localhost:8000/api/v1/podcast/list/?page=1&size=10",
  {
    method: http.RequestMethod.GET,
    extraData: {},
    header: { 'Authorization': 'Bearer your_token' }
  },
  (err, data) => {
    if (!err) {
      console.log("播客列表:", data.result);
    } else {
      console.error("请求失败:", err);
    }
  }
);
```