main(){
ThreeKingdoms threeKingdoms = ThreeKingdoms();
print(threeKingdoms.name);
threeKingdoms.sayName();

ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2("유비", "촉");
threeKingdoms2.saySomething();
}//main

class ThreeKingdoms{
  //Field
  String name ='유비';
  //Constructor

  //Method or Function
  sayName(){
    print("내 이름은 ${this.name }입니다."); //내 field 에 있는 변수값임을 알려주기 위해 this을 적음 
  }
}


//생성자 만드는 클래스
class ThreeKingdoms2{
  //Field
 late String name; //지금 없지만 있다가 준다는 의미
 String? nation;  //또는 null로 주기 

 // Constructor
 ThreeKingdoms2(String name, String nation)
  : this.name = name,
  this.nation = nation;

  //Method
  saySomething(){
    print("제 이름은 ${this.name}이고 조국은 ${this.nation} 입니다.");
  }



}