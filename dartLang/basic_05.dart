main(){
  //Function
  List<int> list1 =[1,3,5,7,9];
  List<int> list2 =[10,30,50,70,90];
  
//_ 가 private 안쓰면 public
  addList(List list){
int sum =0;
  for(int i in list){
    sum +=i;
  }
  print("합계 : $sum");
  }

  addList(list1);
  addList(list2);

int addList2(List list){
int sum =0;
  for(int i in list){
    sum +=i;
  }
 return sum;
  }
int result = addList2(list1);
print(result);
}