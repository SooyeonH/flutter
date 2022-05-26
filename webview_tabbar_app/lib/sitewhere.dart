import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Sitewhere extends StatefulWidget {
  final String url;

  const Sitewhere({Key? key, required this.url}) : super(key: key);

  @override
  State<Sitewhere> createState() => _SitewhereState();
}

class _SitewhereState extends State<Sitewhere> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = "www.daum.net";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
        children: [
          WebView(
            initialUrl: 'http://${widget.url}',
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
    
  }
