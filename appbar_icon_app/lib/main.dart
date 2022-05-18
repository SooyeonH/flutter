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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Icon'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        leading: IconButton(
          //leading은 하나밖에 못씀
          onPressed: () {
            //
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [  //버튼 달수 있는 것 
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.email),
          ), //오른쪽 정렬이됨
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_alarm),
          ), //오른쪽 정렬이됨
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_outlined),
          ), //오른쪽 정렬이됨
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: GestureDetector(  //이미지에 액션 달기 위해 써야함
                onTap: () {
                  //
                },
               child: Image.asset(
                 'images/smile.png',
               width:30 ,
               height: 30,
               ),
             ),
             
           ),
          
        ],
      ),
    );
  }
}
