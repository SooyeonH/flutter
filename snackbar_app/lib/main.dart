import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
        title: const Text("Snack Bar"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body:
         
          const MySnackBar(),
        
        
        
      
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         //안에서 스낵바
    //         // ScaffoldMessenger.of(context).showSnackBar(
    //         //   const SnackBar(
    //         //     content: Text('Elevated button is clicked'),
    //         //     duration: Duration(seconds: 1),
    //         //     backgroundColor: Colors.red,
    //         //     ),
    //         // );
    //         snackbarFunction(context);
    //       },
    //       child: const Text('Snackbar Button'),
    //     ),
    //   ),
    );
  }

  // //--functions 으로 쓰기 
  // snackbarFunction(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Elevated button is clicked'),
  //       duration: Duration(seconds: 1),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }
} //end

//코드 만들어쓰기, 함수로 쓰기,  class로쓰기 세가지가 있음
