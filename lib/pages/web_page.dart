import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webPage extends StatefulWidget{
  _webPageState createState() => _webPageState();
}

class _webPageState extends State<webPage> {

  WebViewController _controller;
  String _title = "webview";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$_title"),
      ),
      child: SafeArea(
        child: WebView(
          initialUrl: "https://flutterchina.club/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            _controller.evaluateJavascript("document.title").then((result){
              setState(() {
                _title = result;
                print(_title);
              });
            }
            );
          },
          navigationDelegate: (NavigationRequest request) {
            if(request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          } ,
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "share",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");
                }
            ),
          ].toSet(),
        ),
      ),
    );
  }
}