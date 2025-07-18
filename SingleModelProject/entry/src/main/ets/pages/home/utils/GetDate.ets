function zero(n:number){
  return n>9?n:"0"+n
}

interface Idate{
  month:string
  day:string|number
}


 function GetDate():Idate {
  let date = new Date();
  let year = date.getFullYear(); //年
  let month = date.getMonth() + 1; //月  0-11
  let monthStr=["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]
  let day = date.getDate(); //日
  let hour = date.getHours(); //  时
  let minute = date.getMinutes(); //分
  let second = date.getSeconds();// 秒

  return {month:monthStr[month-1],day:day,}
}

export { GetDate, Idate }