import 'dart:ui';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("Text button"); //한번 누르면 뜨는것
              },
              onLongPress: () {
                print("long pressed text button"); //길게 누르면 뜨는것
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ), //눌렀을때 어떻게 할건지
              child: const Text(
                'text button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ), //child가 버튼 글씨
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    //모서리를 더 둥글게
                    20,
                  ),
                ),
              ),
              child: const Text('elevated button'),
            ),

            OutlinedButton(
              onPressed: () {
                //-
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: const BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Text(
                'outlined button',
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: const Size(200, 40), //글씨가 크나 작나 모양사이즈가 고정됨
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
           OutlinedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
              ),
              label: const Text('Go to home'),
              style: OutlinedButton.styleFrom(
                primary: Color.fromARGB(255, 240, 176, 197),
                backgroundColor: Color.fromARGB(255, 248, 229, 235),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: const Text('TextButton'),
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: const Text('ElevatedButton'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
