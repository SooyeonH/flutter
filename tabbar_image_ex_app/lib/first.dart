import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:tabbar_image_ex_app/secondpage.dart';
import 'package:tabbar_image_ex_app/thirdpage.dart';

import 'firstpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const ThirdPage(),));
    
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
               
              ),
              child: const Text('pikachu3'),
            ),
          ],
    ),
      ),
    );
  }
}


