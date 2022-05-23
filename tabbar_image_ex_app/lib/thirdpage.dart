import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: const Text("Third Pika"),
      ),
body:  Center(
  child: Image.asset('images/pikachu-3.jpg'),
    ),
    );
  }
}