import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//http setting
import 'package:http/http.dart' as http;
import 'package:json_movies/sub.dart';

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
  late List data;
  late int Click;
  late Color colorname;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    Click = 0;
    colorname = Colors.pinkAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Movie'),
      ),
      body: Center(
          child: data.isEmpty
              ? const Text('데이터가 없습니다.')
              : ListView.builder(
                  itemCount: data.length ~/ 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          return clicknum();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 190,
                              height: 150,
                              child: Card(
                                color: colorname,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          data[index * 2][
                                              'image'], //사진을 네트워크에서 받아와야해서 asset이 아닌 network
                                          width: 100,
                                          height: 120,
                                        ),
                                        Text(
                                          data[index * 2]['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 190,
                              height: 150,
                              child: Card(
                                color: colorname,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          data[index * 2 + 1][
                                              'image'], //사진을 네트워크에서 받아와야해서 asset이 아닌 network
                                          width: 100,
                                          height: 120,
                                        ),
                                        Text(
                                          data[index * 2 + 1]['title'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }

  //future 는 다른거 다한 다음 순서라는 의미
  Future<bool> getJSONData() async {
    //async가 비동기라는 의미 38번째줄이랑 42번째줄이 같이 시작됨
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http
        .get(url); //get방식으로 많이씀 그래야 암호화해서 압축해서옴, await는 정보받아올때까지 기다렸다가 띄우기 위해

    setState(() {
      //가져온 데이터 알아보기 쉽게 변형시키기
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //results 안에 데이터를 리스트로 넣기
      List result = dataConvertedJSON['results'];
      //add는 리스트 한줄씩 넣는건데 한꺼번에 넣기 위해 addall을 사용함
      data.addAll(result);
    });

    //print(result);
    // print(result[0]['code']);
    //print(data[0]);
    return true;
  }

  clicknum() async {
    setState(() {
      Click = Click + 1;

      if (Click % 2 == 0) {
        colorname = Colors.amber;
      } else {
        colorname = Colors.blue;
      }
    });
  }
}
