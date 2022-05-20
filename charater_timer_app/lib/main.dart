import 'dart:async';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String displayCharater;
  late List str;
  late String charater;
  late int num2;

  @override
  void initState() {
    super.initState();
    displayCharater = '대한민국';
    str = displayCharater.split('');
    num2 = 0;
    charater = '';
   

    //Timer
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeword();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Text(charater,
        style: TextStyle(fontSize: 30,),
        ),
      ),
    );
  }

  changeword() {
    setState(() {
      if(num2 == str.length){
        num2 = 0;
        charater = '';
      }
      charater += str[num2];
      num2++;
    });
  }
}
