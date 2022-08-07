import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final _web_url;
  final _title;

  const WebViewPage(this._web_url, this._title, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState(_web_url, _title);
  }
}

class _WebViewPageState extends State<WebViewPage> {
  var _web_url;
  var _title;
  var _showLoading = true;

  _WebViewPageState(this._web_url, this._title);

  @override
  void initState() {
    super.initState();
    print('WebViewPage createState $_web_url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Offstage(
            offstage: !_showLoading,
            child: const LinearProgressIndicator(),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: _web_url,
            onProgress: (pregress) => {print('WebViewPage pregress $pregress')},
            onPageStarted: (url) =>
                {print('WebViewPage onPageStarted $url start load')},
            onPageFinished: (url) {
              print('WebViewPage onPageFinished $url load finish');
              _showLoading = false;
              setState(() {});
            },
          ))
        ],
      ),
    );
  }
}
