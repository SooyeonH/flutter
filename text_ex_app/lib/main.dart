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


//key 값은 소문자 class들은 대문자로 시작!! 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Text Exercise 01"),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(   //center 는 child 하나만 가짐 
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
                 Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
       
            Text(
              "유비",
            ),
            Text(
              "관우",
            ),
            Text(
              "장비",
            ),
            Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
            Text(
              "조조",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            Text(
              "여포",
            ),
            Text(
              "동탁",
            ),
                 Divider(
              height: 30,
              color: Colors.grey,
              thickness: 0.5,
            ),
       
          ],
        ),
      ),
    ); //리턴은 세미콜론으로 마무리
  }
}
