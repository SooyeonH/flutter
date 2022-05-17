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
        title: const Text("Image Fitting"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.contain, //박스안에서 비율에 맞게 
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.fill, //꽉맞게
            ),
                  Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.cover,
            ),
      
          ],
        ),
      ),
    );
  }
}