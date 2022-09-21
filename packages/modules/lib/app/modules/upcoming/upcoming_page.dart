import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'upcoming_store.dart';

class UpcomingPage extends StatefulWidget {
  final String title;
  const UpcomingPage({Key? key, this.title = 'Upcoming'}) : super(key: key);
  @override
  UpcomingPageState createState() => UpcomingPageState();
}

class UpcomingPageState extends State<UpcomingPage> {
  final UpcomingStore store = Modular.get();

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
