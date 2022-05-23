import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({Key? key}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
   late List imageName;
  late int currentImage; //LIstindex

  @override
  void initState() {
    super.initState();
    imageName = [
      'pikachu-1.jpg',
      'pikachu-2.jpg',
      'pikachu-3.jpg',
      
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
