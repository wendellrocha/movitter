import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'now_playing_store.dart';

class NowPlayingPage extends StatefulWidget {
  final String title;
  const NowPlayingPage({Key? key, this.title = 'NowPlayingPage'})
      : super(key: key);
  @override
  NowPlayingPageState createState() => NowPlayingPageState();
}

class NowPlayingPageState extends State<NowPlayingPage> {
  final NowPlayingStore store = Modular.get();

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
