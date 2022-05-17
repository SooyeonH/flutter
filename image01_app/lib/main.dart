import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  //class이름이 제일 중요!! 위랑 맞추기
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text("Image 01"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-1.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  backgroundColor: Colors.red, //배경이 투명도 있는 사진이면 백그라운드 컬러가 적용이 됨
                  radius: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
