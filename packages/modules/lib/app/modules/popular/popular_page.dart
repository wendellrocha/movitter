import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'domain/entities/result_popular_movies.dart';
import 'domain/errors/errors.dart';
import 'popular_controller.dart';
import 'popular_store.dart';

class PopularPage extends StatefulWidget {
  final String title;
  const PopularPage({Key? key, this.title = 'PopularPage'}) : super(key: key);
  @override
  PopularPageState createState() => PopularPageState();
}

class PopularPageState extends State<PopularPage> {
  final PopularController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: ScopedBuilder<PopularStore, FailurePopularMovies,
          ResultPopularMovies>(
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
