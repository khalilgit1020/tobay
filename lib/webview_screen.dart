/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key}) : super(key: key);

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://tobay.net/',
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  WebViewContainer();

  @override
  createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer>
    with TickerProviderStateMixin {
  final _key = UniqueKey();

  int position = 1;

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  AnimationController? _controller;

  Animation<Offset>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 1),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCubic,
    ));


    Future.delayed(const Duration(seconds: 3000), () {
      _controller!.reverse();
    });

  }


  _WebViewContainerState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('متجر توباي'),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: position,
          children: [
            WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://tobay.net/',
              onPageFinished: doneLoading,
              onPageStarted: startLoading,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Sonar(
                  radius: 150,
                  child:  Image.asset('assets/tobay.png',width: 500,height: 500,),

                ),
              ),
            ),
          ],
        ));
  }
}
