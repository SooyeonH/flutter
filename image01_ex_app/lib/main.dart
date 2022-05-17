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
      backgroundColor: Color.fromARGB(255, 231, 109, 21),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Image Ex01'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
              const CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
                radius: 50,
              ),
           
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                  radius: 50,
                ),
              ),
          
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                  radius: 50,
                ),
              ),
            ],
          )
        ],
      ),
      ),
    );
  }
}