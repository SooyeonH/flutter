import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/fixpage.dart';

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
  late TextEditingController textEditingController;
  late String textvalue1;
  late String path;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textvalue1 = "글자를 입력하세요";
    path = "images/lamp_on.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main 화면"),
        actions: [
          IconButton(
            onPressed: () {
              textvalue1 = textEditingController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Fixpage(
                      textvalue: textvalue1,
                    );
                  },
                ),
              ).then((value) => contenta(value));
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: textvalue1),
                keyboardType: TextInputType.text,
              ),
            ),
            Image.asset(
              path,
              width: 150,
              height: 200,
            ),
          ],
        ),
      ),
    );
  } 

  contenta(List aaa) {
    setState(() {
      if (aaa[0] == "") {
      } else {
        textEditingController.text = aaa[0];
        textvalue1 = aaa[0];
      }
      path = aaa[1] ? 'images/lamp_on.png' : 'images/lamp_off.png';
    });
  }
}
