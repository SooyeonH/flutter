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
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String _lampImage; //Image name
  
  late String _lampstate;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampstate = 'on';
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //sizebox 대신 container 쓰면 색을 지정할 수 있음 color: 으로!
              width: 350,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, //컬럼을 넣어줘야 사이즈 박스랑 이미지 크기랑 따로 지정이 가능
                children: [
                  Image.asset(
                    _lampImage,
                    width: 300,
                    height: 400,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_lampstate == "off") {
                        decisionOnOff();
                      } else {
                        _showDialog(context);
                      }
                    });
                  },
                  child: Text('켜기'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showDialog2(context);
                    });
                  },
                  child: Text('끄기'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //function
  decisionOnOff() {
    //switch는 bool함수여서 ==true를 써주지 않아도됨
    _lampstate = "on";
    _lampImage = 'images/lamp_on.png';
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('경고'),
          content: const Text('현재 램프가 켜진 상태입니다.'),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('네 알겠습니다'),
              ),
            ),
          ],
        );
      },
    );
  }

  _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('램프끄기'),
          content: const Text('램프를 끄시겠습니까?'),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _lampImage = 'images/lamp_off.png';
                        _lampstate = "off";
                        Navigator.of(ctx).pop();
                      });
                    },
                    child: const Text('네'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('아니요'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
} //end
