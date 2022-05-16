import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
        title: const Text(
          "image padding",
        ),
       
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  "images/pikachu-1.jpg",
                
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  "images/pikachu-2.jpg",
                 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  "images/pikachu-3.jpg",
                  
                ),
              ),
              ],
          ),
        ),
      ),
    );
  }
}
