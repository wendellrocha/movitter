import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'domain/entities/result_popular_movies.dart';
import 'domain/errors/errors.dart';
import 'home_controller.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<HomeStore, FailurePopularMovies, ResultPopularMovies>(
        store: controller.store,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (context, error) => Center(
          child: Text(error!.message),
        ),
        onState: (context, state) => ListView.builder(
          itemCount: state.popularMovies.length,
          itemBuilder: (_, i) => Text(
            state.popularMovies[i].title,
          ),
        ),
      ),
    );
  }
}
