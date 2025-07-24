import { QuestionLocalClass, QuestionLocalItem } from '../../models';
import { PersistenceV2 } from '@kit.ArkUI';

class QuestionLocal{
  // 存一道题目信息到本地

  setQuestion(key:string,question:QuestionLocalItem){
    let appQuestion=PersistenceV2.connect(QuestionLocalClass,key,()=>new QuestionLocalClass())!

    appQuestion.question.id=question.id
    appQuestion.question.stem=question.stem
    appQuestion.question.difficulty=question.difficulty
    appQuestion.question.likeCount=question.likeCount
    appQuestion.question.views=question.views
    appQuestion.question.readFlag=question.readFlag
    appQuestion.question.answer=question.answer
    appQuestion.question.stage=question.stage
    appQuestion.question.collectFlag=question.collectFlag
    appQuestion.question.likeFlag=question.likeFlag

  }
  // 获取本地一道题目
  getQuestion(key:string){
    let appQuestion=PersistenceV2.connect(QuestionLocalClass,key,()=>new QuestionLocalClass())!
    return appQuestion.question
  }

  // 验证某一题是否在本地仓库中
  checkQuestion(key:string){

    return PersistenceV2.keys().includes(key)
  }
}

export const  questionLocal=new  QuestionLocal()