main(){
  //final 과 const
  final String name1 ='유비'; //다음부터 변경불가

 const String name2 = '관우';
 //name2='whwh'; 마찬가지 바꿀수 없음

 final DateTime now1 = new DateTime.now();
 //final 은 실행될때 결정됨!! 시간은 흘러가는데 파이널이 되는이유! 실행될때 시간으로 고정됨
 //const DateTime now2 = DateTime.now();  const는 코딩할때부터 정해진 값만 가능!!

 

}