import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName ="www.daum.net";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Column(
          children: [
            const Text('WebView'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: (){
                  
                  setState(() {
                    siteName='www.google.com';
                  });
                  _reloadSite();
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text("Google")
                ),
                SizedBox(
                  width: 10,
                ),
ElevatedButton(onPressed: (){
              setState(() {
                siteName='www.naver.com';
              });
              _reloadSite();
            }, 
            style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
            child: const Text("Naver")
            ),
             SizedBox(
                  width: 10,
                ),
             ElevatedButton(onPressed: (){
              setState(() {
                siteName='www.daum.net';
              });
              _reloadSite();
            }, 
            child: const Text("Daum")
            ),

              ],
            ),
             
          ],
        )),
        toolbarHeight: 100,
      ),
      
      body: Stack(
        children: [
          WebView(
            initialUrl:'http://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            //실행할떄 뺑뺑도는 부분 다 되면 뺑뻉이 그만 돌라는 의미
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          //context는 어떤걸 클릭했냐 어싱크는 어떤화면
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  controller.data!.goBack();
                },
                child: const Icon(Icons.arrow_back),
              );
            }
            return Stack();
          }),
    );
  }
  _reloadSite(){
    _controller.future.then((value) => value.loadUrl('http://$siteName'));
  }
}
