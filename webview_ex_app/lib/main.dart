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
            child: Row(
              children: [
                Flexible(  //appbar는 사이즈가 정해져있어서 텍스트필드가 그것보다 크면 오류가 걸리기 때문에 flexible로 사이즈 정해서 에러해결
                  child: TextField(
                    autocorrect: false,
                    controller: textEditingController,
                    decoration: const InputDecoration(labelText: "site 이름을 입력하세요"),
                  ),
                ),
                IconButton(onPressed: 
                (() {
                  _reloadSite();
                }), icon: const Icon(Icons.search))
              ],
            )),
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

  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('http://${textEditingController.text}'));
  }
}
