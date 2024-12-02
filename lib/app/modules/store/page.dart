import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StorePage extends StatelessWidget {

  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 허용
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('Loading progress: $progress%');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web resource error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://pinandmore.com/')); // 특정 사이트 로드

    return Scaffold(
      appBar: AppBar(
        title: Text('스토어'),
      ),
      body: Column(
        children: [
          // WebView 표시
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
