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
  

  late TextEditingController textEditingController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = "www.daum.net";
  @override
  void initState() {

    super.initState();
    textEditingController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
            child: const Text('Floating Button Webview',
            style: TextStyle(color: Colors.black),),),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'http://$siteName',
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20,),
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      controller.data!.goBack();
                    },
                    foregroundColor: Colors.black,
                    child: const Icon(Icons.arrow_back),
                    
                  ),
                  const SizedBox(width: 10,),
                  FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () {
                      controller.data!.reload();
                    },
                    foregroundColor: Colors.black,
                    child: const Icon(Icons.replay),
                  ),
                  const SizedBox(width: 10,),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      controller.data!.goForward();
                    },
                    foregroundColor: Colors.black,
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              );
            }
            return Stack();
          }),
    );
  }

  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('http://${textEditingController.text}'));
  }
}
