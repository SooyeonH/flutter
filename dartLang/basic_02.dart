main(){
  List threeKingdoms =[];
  //추가하기
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  print(threeKingdoms);
  print(threeKingdoms[0]);

  //수정하기
  threeKingdoms[0]="we";
  print(threeKingdoms);

  //삭제하기 
  threeKingdoms.removeAt(1);
  print(threeKingdoms);

  threeKingdoms.remove("we");
  print(threeKingdoms);

  print(threeKingdoms.length);

  threeKingdoms.add(1);
  print(threeKingdoms);
  
  List<String> threeKingdoms2 =[];
  //-----
  // Map : Key와 Value 로 이루어진 Collection
  Map fruits = {
    'apple' : '사과',
    'grape' : '포도',
    'watermelon' : '수박',
  };
  print (fruits['apple']);

//수정하기
fruits['watermelon'] = '시원한수박';
fruits['banana'] = '바나나';
print(fruits);

Map<String,int> fruitsPrice ={
  'apple' : 1000,
  'grape' :2000,
  'watermelon' :3000,
};
print(fruitsPrice['apple']);

int applePrice = fruitsPrice['apple']!;

int? numB =100;
numB = null;
// int numA =10; 일때 numA = null;  이거안됌!!
}
