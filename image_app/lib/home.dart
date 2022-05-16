
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Image Padding"),
      ),
      body: Center(
        
        child: Column(
          children: [
           
          Image.asset(
          'images/smile(1).png',
          width: 200,
          height: 200,
        ),
        ],
        ),
        ),
      );
    
  }
}