import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      // 메뉴바 내부
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero, //padding 을 꽉 채워줌 (아이폰에서 시간 보여지는 부분 )
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/pikachu-1.jpg'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-2.jpg'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-3.jpg'),
              ),
            ],
            accountName: Text('Pikachu'),
            accountEmail: Text('pikavhu@naver.com'),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              ),
            ),
          ),
          ListTile(
            onTap: (){
              //
            },
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: const Text('Home'),
            
            trailing: const Icon(Icons.add,),
          ),
        ],
      )),
    );
  }
}
