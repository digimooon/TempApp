import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatelessWidget {
  static const URL = "https://www.baidu.com";
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var flag = await _controller.canGoBack();
        if (flag) _controller.goBack();
        return !flag;
      },
      child: WebView(
          initialUrl: URL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            this._controller = controller;
          }),
    );
  }
}
