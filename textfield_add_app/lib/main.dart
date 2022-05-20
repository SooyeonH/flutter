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
  String ment="";
  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
        ),
        body: Column(
          children: [
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
                    setState(
                      () {
                        sum = int.parse(textEditingController1.text) +
                            int.parse(textEditingController2.text);
                            ment='입력하신 숫자의 합은 $sum 입니다.'
;                      },
                    );
                  }
                },
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    Text('덧셈 계산'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              ment,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        ),
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
}
