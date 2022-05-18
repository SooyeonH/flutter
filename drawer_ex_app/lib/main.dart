import 'package:drawer_ex_app/screen.dart';
import 'package:drawer_ex_app/screen1st.dart';
import 'package:drawer_ex_app/screen2nd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Screen(),
        '/1st': (context) => const Screen1st(),
        '/2nd': (context) => const Screen2nd(),
      },
      initialRoute: '/',
    );
  }
}
