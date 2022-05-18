import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Screen(),
        '/1st' :(context) => const Screen1st(),
        '/2nd' :(context) {
          return const Screen2nd();
        },
      },
      initialRoute: '/',   //시작하자마자 초기화면이 screen 으로 가야하니까 
    );
  }
}
