import 'package:flutter/material.dart';

import 'fix.dart';
import 'message.dart';

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
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Main 화면'),
       actions: [
         IconButton(onPressed: (){
           Navigator.push(context, 
           MaterialPageRoute(builder: (context){
             return const Fixpage();
           },),
           );
         },
          icon: const Icon(Icons.edit),
          ),
       ],

     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           
           Image.asset(Message.lampstate,
           width: 150,
           height: 200,
           ),
         ],
       ),
     ),
   ); 
  }
}