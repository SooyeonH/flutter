import 'package:flutter/material.dart';

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
  late Color _buttonColor = Colors.blue;
  late bool SwitchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changed Button color on Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: const Text('Flutter'),
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(
                value: SwitchValue,
                onChanged: (value) {
                  //사용자가 움직이는 값
                  setState(() {
                    SwitchValue = value;
                    _onClick();
                  });
                }),
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      if (SwitchValue == false) {
        _buttonColor = Colors.blue;
      } else {
        _buttonColor = Colors.red;
      }
    });
  }
}
