import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
  late List imageName;
  late int currentImage; //LIstindex

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVericalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
                height: 600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //function
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        //사진이 끝까지 보여줬는데 또 오른쪽으로 넘기면 맨 첫 이미지 보여주기
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else if (direction == SwipeDirection.right) {
        currentImage -= 1;

        //사진 첫장인데 왼쪽으로 넘길때 마지막 이미지 보여주기
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVericalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        //사진이 끝까지 보여줬는데 또 오른쪽으로 넘기면 맨 첫 이미지 보여주기
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else if (direction == SwipeDirection.up) {
        currentImage -= 1;

        //사진 첫장인데 왼쪽으로 넘길때 마지막 이미지 보여주기
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
}
