import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'top_rated_store.dart';

class TopRatedPage extends StatefulWidget {
  final String title;
  const TopRatedPage({Key? key, this.title = 'TopRatedPage'}) : super(key: key);
  @override
  TopRatedPageState createState() => TopRatedPageState();
}

class TopRatedPageState extends State<TopRatedPage> {
  final TopRatedStore store = Modular.get();

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
