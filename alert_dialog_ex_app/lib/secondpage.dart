import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
         backgroundColor: Colors.red,
        title: const Text("Second Page"),
      ),
      body: Center(
        
          child: const Text(
            "2번째 페이지 입니다.",
          
        ),
      ),
    );
  }
}