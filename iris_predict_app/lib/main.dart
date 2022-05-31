import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //field
  late TextEditingController sepalLength;
  late TextEditingController sepalWidth;
  late TextEditingController petalLength;
  late TextEditingController petalWidth;

  late String SLength;
  late String SWidth;
  late String PLength;
  late String PWidth;
  late String result;
  late String img;

  @override
  void initState() {
    super.initState();
    sepalLength = TextEditingController();
    sepalWidth = TextEditingController();
    petalLength = TextEditingController();
    petalWidth = TextEditingController();
    img = 'images/all.jpg';
    result = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iris 품종 예측'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: sepalLength,
                decoration: const InputDecoration(
                    labelText: 'Sepal Length의 크기를 입력하세요 '),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: sepalWidth,
                decoration:
                    const InputDecoration(labelText: 'Sepal Width의 크기를 입력하세요 '),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: petalLength,
                decoration: const InputDecoration(
                    labelText: 'Petal Length의 크기를 입력하세요 '),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: petalWidth,
                decoration:
                    const InputDecoration(labelText: 'Pepal Width의 크기를 입력하세요 '),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  SLength = sepalLength.text;
                  SWidth = sepalWidth.text;
                  PLength = petalLength.text;
                  PWidth = petalWidth.text;
                  insertAction();
                },
                child: const Text("입력"),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  insertAction() async {
    var url = Uri.parse(
        'http://192.168.150.132:8080/Rserve/response_iris.jsp?sepalLength=$SLength&sepalWidth=$SWidth&petalLength=$PLength&petalWidth=$PWidth');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      if (result == 'setosa') {
        img = "images/setosa.jpg";
      }
      if (result == 'versicolor') {
        img = "images/versicolor.jpg";
      }
      if (result == 'virginica') {
        img = "images/virginica.jpg";
      }
      _showDialog(context);
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('품종 예측 결과'),
            content: Text("입력하신 품종은 $result 입니다"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
