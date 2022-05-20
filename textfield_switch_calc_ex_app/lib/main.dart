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
  
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late TextEditingController textEditingController3;
  late TextEditingController textEditingController4;
  late TextEditingController textEditingController5;
  late TextEditingController textEditingController6;

  //스위치
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;
  int num2=0;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    textEditingController4 = TextEditingController();
    textEditingController5 = TextEditingController();
    textEditingController6 = TextEditingController();
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
          title: const Text('간단한 계산기'),
        ),

        //스크롤
        body: SingleChildScrollView(
          child: Column(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //입력확인
                        if (textEditingController1.text.trim().isEmpty ||
                            textEditingController2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        }
                        if (switchValue1 == true) {
                          setState(() {
                            int num1 = int.parse(textEditingController1.text) +
                                int.parse(textEditingController2.text);
                            textEditingController3.text = num1.toString();
                          });
                        } else {
                          setState(() {
                            textEditingController3.text = "";
                          });
                        }
                        ;
                        if (switchValue2 == true) {
                          setState(() {
                            int num1 = int.parse(textEditingController1.text) -
                                int.parse(textEditingController2.text);
                            textEditingController4.text = num1.toString();
                          });
                        } else {
                          setState(() {
                            textEditingController4.text = "";
                          });
                        }
                        ;
                        if (switchValue3 == true) {
                          setState(() {
                            int num1 = int.parse(textEditingController1.text) *
                                int.parse(textEditingController2.text);
                            textEditingController5.text = num1.toString();
                          });
                        } else {
                          setState(() {
                            textEditingController5.text = "";
                          });
                        }
                        ;
                        if (switchValue4 == true) {
                          setState(() {
                             double num1 =
                                int.parse(textEditingController1.text) /
                                    int.parse(textEditingController2.text);
                            textEditingController6.text = num1.toString();
                          });
                        } else {
                          setState(() {
                            textEditingController6.text = "";
                          });
                        }
                        ;
                      },
                      child: Text('계산하기'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //입력확인

                        setState(
                          () {
                            textEditingController1.text = "";
                            textEditingController2.text = "";
                            textEditingController3.text = "";
                            textEditingController4.text = "";
                            textEditingController5.text = "";
                            textEditingController6.text = "";
                          },
                        );
                      },
                      child: Text('지우기'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('덧셈'),
                  const SizedBox(
                    width: 2,
                  ),
                  Switch(
                      value: switchValue1,
                      onChanged: (value) {
                        setState(() {
                          switchValue1 = value;
                        });
                      }),
                  const Text('뺄셈'),
                  const SizedBox(
                    width: 2,
                  ),
                  Switch(
                      value: switchValue2,
                      onChanged: (value) {
                        setState(() {
                          switchValue2 = value;
                        });
                      }),
                  const Text('곱셈'),
                  const SizedBox(
                    width: 2,
                  ),
                  Switch(
                      value: switchValue3,
                      onChanged: (value) {
                        setState(() {
                          switchValue3 = value;
                        });
                      }),
                  const Text('나눗셈'),
                  const SizedBox(
                    width: 2,
                  ),
                  Switch(
                      value: switchValue4,
                      onChanged: (value) {
                        setState(() {
                          switchValue4 = value;
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController3,
                  decoration: const InputDecoration(labelText: '덧셈 결과'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController4,
                  decoration: const InputDecoration(labelText: '뺄셈 결과'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController5,
                  decoration: const InputDecoration(labelText: '곱셈 결과'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: textEditingController6,
                  decoration: const InputDecoration(labelText: '나눗셈 결과'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
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
