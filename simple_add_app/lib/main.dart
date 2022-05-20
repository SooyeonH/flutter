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
  //field
  int sum = 0;
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '덧셈 결과 :$sum',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController1,
              decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController2,
              decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                //입력확인
                if (textEditingController1.text.trim().isEmpty ||
                    textEditingController2.text.trim().isEmpty) {
                  errorSnackBar(context);
                } else {
                  showSnackBar(context);
                }
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  const Text('덧셈 계산'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  showSnackBar(BuildContext context) {
    setState(() {
      sum = int.parse(textEditingController1.text) +
          int.parse(textEditingController2.text);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '${textEditingController1.text} 와 ${textEditingController2.text}의  합은 ${int.parse(textEditingController1.text) + int.parse(textEditingController2.text)} 입니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
