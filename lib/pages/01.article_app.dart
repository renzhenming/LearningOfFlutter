import 'package:flutter/material.dart';
import 'package:flutter_app/pages/03.article_page.dart';

class ArticleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home页面',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const ArticlePage(),
    ));
  }

}