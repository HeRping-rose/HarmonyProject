const day=60*60*24
const hour=60*60
const minute=60

//second =87195808

export  function  formatTime(second:number){
  if(second>day){
    return(second/day).toFixed(1)+'天'
    }else if(second>hour){
    return(second/hour).toFixed(1)+'小时'
  }else if(second>minute){
    return(second/minute).toFixed(0)+'分钟'
  }else{
    return second+'秒'
  }
}