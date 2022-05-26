import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_tabbar_app/sitewhere.dart';

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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = "www.daum.net";
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); //super 전에 해야함
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(child: Text('WebView-Tabbar')),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Sitewhere(url: 'www.naver.com'),
          Sitewhere(url: 'www.google.com'),
          Sitewhere(url: 'www.daum.net')
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(controller: controller,
        labelColor: Colors.black,
        
        
         tabs: [
          Tab(
            icon: Image.asset(
              'images/naver.png',
              width: 80,
              height: 40,
            ),
            text: '네이버',
           
            
          ),
          Tab(
            icon: Image.asset(
              'images/google.png',
              width: 80,
              height: 40,
            ),
            text: '구글',
          ),
          Tab(
            icon: Image.asset(
              'images/daum.png',
              width: 80,
              height: 40,
            ),
            text: '다음',
          ),
        ]),
      ),
    );


}
    }