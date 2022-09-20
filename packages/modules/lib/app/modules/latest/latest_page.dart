import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'latest_store.dart';

class LatestPage extends StatefulWidget {
  final String title;
  const LatestPage({Key? key, this.title = 'LatestPage'}) : super(key: key);
  @override
  LatestPageState createState() => LatestPageState();
}

class LatestPageState extends State<LatestPage> {
  final LatestStore store = Modular.get();

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
