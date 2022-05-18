import 'package:ex_navigator_pikachu/pages/first_page.dart';
import 'package:ex_navigator_pikachu/pages/second_page.dart';
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
        primarySwatch: Colors.orange,
   
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
        title: const Text('pika pika'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const FirstPage(),));
    
              },
              

              child: const Text('pikachu1'),
            ),

             ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const SecondPage(),));
    
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
               
              ),
              child: const Text('pikachu2'),
            ),
          ],
    ),
      ),
    );
  }
}


