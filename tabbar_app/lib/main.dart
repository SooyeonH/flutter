import 'package:flutter/material.dart';
import 'package:tabbar_app/first_page.dart';
import 'package:tabbar_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
    
    //property
    late TabController controller;
    @override
  void initState() {
    super.initState();
    controller = TabController(length: 2,//사용할 탭 개수 
     vsync: this
     );
  }
  @override
  void dispose() {
    controller.dispose(); //super 전에 해야함 
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab bar Test'),
      // ),
      body:TabBarView(
        controller: controller,
        children: [
          FirstPage(),const SecondPage()],
        ),
        bottomNavigationBar: Container(
          color: Colors.yellowAccent,
          height: 100,
          child: TabBar(
            
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                icon:Icon(
                  
                Icons.looks_one,
                color:Colors.blue,
                ),
                text: "One",
              ),
               Tab(
                icon:Icon(
                  
                Icons.looks_two,
                color:Colors.red,
                ),
                text: "Two",
              ),
            ]),
        )
    );
  }
}
