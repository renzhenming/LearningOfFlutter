import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  var _web_url;
  var _title;

  WebViewPage(this._web_url, this._title);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState(_web_url, _title);
  }
}

class _WebViewPageState extends State<WebViewPage> {
  var _web_url;
  var _title;

  _WebViewPageState(this._web_url, this._title);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: LinearProgressIndicator(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: WebView(
            // javascriptMode: JavascriptMode.unrestricted,
            // initialUrl: _web_url,
          ))
        ],
      ),
    );
  }
}
