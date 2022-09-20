import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'trending_store.dart';

class TrendingPage extends StatefulWidget {
  final String title;
  const TrendingPage({Key? key, this.title = 'TrendingPage'}) : super(key: key);
  @override
  TrendingPageState createState() => TrendingPageState();
}

class TrendingPageState extends State<TrendingPage> {
  final TrendingStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const <Widget>[],
      ),
    );
  }
}
