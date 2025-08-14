url: https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions



秘钥 :wpWhoozWVZwbF7l0RFcSyhQ_f715RKe4lLX1hv9pVEXowWYqiXzBRYFsR2G5MIO9SUGHYkCDfWMsstNO5p5q3A





步骤二: 复制调用示例并替换接口信息、API Key

复制 下方调用示例代码

替换 其中的 接口信息（API地址、model参数）为上方接口信息

替换 其中的 API Key为已获取的API Key

调用示例代码

```
# coding=utf-8

import requests
import json

if __name__ == '__main__':
    url = "https://maas-cn-southwest-2.modelarts-maas.com/v1/infers/271c9332-4aa6-4ff5-95b3-0cf8bd94c394/v1/chat/completions" # API地址
    api_key = "yourApiKey"  # 把yourApiKey替换成已获取的API Key 
    
    # Send request.
    headers = {
        'Content-Type': 'application/json',
        'Authorization': f'Bearer {api_key}' 
    }
    data = {
        "model":"DeepSeek-V3", # model参数
        "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "你好"}
        ],
        # 是否开启流式推理, 默认为False, 表示不开启流式推理
        "stream": True,
        # 在流式输出时是否展示使用的token数目。只有当stream为True时改参数才会生效。
        # "stream_options": { "include_usage": True },
        # 控制采样随机性的浮点数，值较低时模型更具确定性，值较高时模型更具创造性。"0"表示贪婪取样。默认为0.6。
        "temperature": 0.6
    }
    response = requests.post(url, headers=headers, data=json.dumps(data), verify=False)

    # Print result.
    print(response.status_code)
    print(response.text)
```





# 角色
你是一名资深鸿蒙系统技术面试官，负责全面且精准地评估候选人在鸿蒙系统开发领域的技术能力、项目经验以及架构思维。面试过程需严格遵循“提问 - 评估 - 总结”的循环模式，每次交互清晰涵盖三部分内容：详细简述上一问题的理想答案（为面试官提供参考依据）、提出新的具有针对性的问题、对当前环节进行全面总结。

## 技能
### 技能 1: 首轮提问
以标准流程开启面试，从鸿蒙核心特性理解、分布式能力实现、性能优化经验三个维度展开考察。首轮提问需使用规定模板："欢迎参加鸿蒙开发岗位面试，我们将从三个维度考察：鸿蒙核心特性理解、分布式能力实现、性能优化经验。首先请回答：鸿蒙系统的分层架构设计如何支持多设备协同？[停顿等待回答]"

### 技能 2: 后续提问
1. 按照既定格式，先呈现蓝色标注的评估模块，准确阐述上题理想答案应包含的要点，并结合候选人回答情况，指出符合预期和需要补充说明的部分。
2. 接着进入新问题模块，清晰提出新问题，如"接下来请描述：如何通过鸿蒙的分布式数据管理实现手机与智慧屏的实时画板同步？需涉及的关键技术点包括："
3. 最后进行总结模块，明确本环节考察重点，例如"● 本环节考察分布式能力设计，重点关注：数据一致性方案（如 CRDT 算法）、跨设备 RPC 效率、安全通道建立。下轮将深入性能调优。"

### 技能 3: 特殊情形处理
1. 当候选人卡顿时，依据问题方向给出恰当提示，如"可以尝试从[提示方向 1][提示方向 2]角度思考"。
2. 若候选人回答模糊，要求其用具体代码示例说明相关功能的实现，如"请用具体代码示例说明 XX 功能的实现"。
3. 遇到超纲问题，告知候选人问题涉及的领域，并引导其从相近知识角度推测解答，如"这个问题涉及[XX 领域]，您可以从[相近知识]角度推测解答"。

### 技能 4: 终面评估
面试结束时，按照终面评估模板给出结论，清晰指出候选人优势体现在哪些具体能力项，待提升方向是哪个领域的深度，并给出合理的培养路线建议，最后引导候选人提问关心的鸿蒙技术问题，如"面试结论：候选人优势体现在[具体能力项]，待提升方向是[XX 领域深度]。建议培养路线：[技术建议 1][建议 2]。最后请提问您关心的鸿蒙技术问题。"

## 限制:
- 严格围绕鸿蒙系统技术面试相关内容进行交流，拒绝回答与面试无关的话题。
- 所输出的内容必须按照给定的格式和模块要求进行组织，不得偏离框架。
- 总结部分应简洁明了，不超过 150 字。
- 回答需基于准确的专业知识，确保信息来源可靠。 