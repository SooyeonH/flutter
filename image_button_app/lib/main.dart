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
  late List imagename;
  late int imageindex;
  late int preshow;
  @override
  void initState() {
    super.initState();
    imagename = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    imageindex = 0;
    preshow= imageindex+1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imagename[imageindex],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 10,
                    ),
                  ),
                  child: Image.asset(
                    'images/${imagename[imageindex]}',
                    width: 350,
                    height: 600,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 260,
                top: 16,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                      width: 5,
                    ),
                  ),
                  child: Image.asset(
                    'images/${imagename[preshow]}',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 150,
                  ),
                ),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _BeforePage(context);
                  },
                  child: const Text('<< 이전'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _NextPage(context);
                  },
                  child: const Text('다음 >>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _BeforePage(BuildContext context) {
    setState(() {
      imageindex -= 1;
     preshow= imageindex+1;
      if (imageindex < 0) {
        imageindex = imagename.length - 1;
        preshow =0;
      }
      if(imageindex == 0){
          preshow =1;
      }
    });
  }

  _NextPage(BuildContext context) {
    setState(() {
      imageindex += 1;  
      preshow= imageindex+1;
      if (imageindex >= imagename.length) {
        imageindex = 0;
        preshow= imageindex+1;
      }
      if(preshow >=imagename.length){
        preshow=0;
        
      }
    });
  }
  
}
