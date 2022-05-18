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
  //property
  late String _buttonState;
  late String _buttonlang ='버튼을 누르세요';
  late Color _buttonColor;
  @override
  void initState() {
    _buttonState = "OFF";
    _buttonColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor),
              ),
              child: Text('$_buttonlang'),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

  _onClick() {
    setState(() {
      //setstate 을 해야 build 가 일을 함
      if (_buttonState == "OFF") {
        _buttonState = "ON";
        _buttonlang="Press the Button";
        _buttonColor=Colors.yellow;
      } else {
        _buttonState = "OFF";
         _buttonlang="버튼을 누르세요";
          _buttonColor=Colors.red;
      }
    });
  }
}//end

