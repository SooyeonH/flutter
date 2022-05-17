main(){
 checkVersion();
 print("End process");

}
//비동기로 만들기 (future async await 는 세트로 !!)
Future checkVersion ()async{
var version = await lookupVersion();
print(version);
}

int lookupVersion(){
  return 12;
}