import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/first.dart';
import 'package:tabbar_image_ex_app/second.dart';
import 'package:tabbar_image_ex_app/third.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  //property
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller=TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: TabBarView(
  controller: controller,
  children: [Firstpage(),Secondpage()]),
  bottomNavigationBar: Container(
    color: Colors.white,
    height: 100,
    child: TabBar(
      controller: controller,
      labelColor: Colors.blue,
      indicatorColor: Colors.red,
      tabs: [
        Tab(
          icon: Icon(
            Icons.badge,
            
            color: Colors.blue,
          ),
          text:"button" ,
        ),
         Tab(
          icon: Icon(
            Icons.tv,
            color: Colors.red,
          ),
          text:"swipe" ,
        ),
         
      ],
    ),
  ),
    );
  }
}