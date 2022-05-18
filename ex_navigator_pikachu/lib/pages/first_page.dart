
import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
        title: const Text("First Pika"),
      ),
body:  Center(
  child: Image.asset('images/pikachu-1.jpg'),
    ),
    );
  }
}