import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'domain/entities/result_top_rated_movies.dart';
import 'domain/errors/errors.dart';
import 'top_rated_controller.dart';
import 'top_rated_store.dart';

class TopRatedPage extends StatefulWidget {
  final String title;
  const TopRatedPage({Key? key, this.title = 'Top Rated'}) : super(key: key);
  @override
  TopRatedPageState createState() => TopRatedPageState();
}

class TopRatedPageState extends State<TopRatedPage> {
  final TopRatedController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: ScopedBuilder<TopRatedStore, FailureTopRatedMovies,
          ResultTopRatedMovies>(
        store: controller.store,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (context, error) => Center(
          child: Text(error!.message),
        ),
        onState: (context, state) => GridView.builder(
          padding: Utils.gridPadding,
          gridDelegate: Utils.gridDelegate,
          itemCount: state.topRatedMovies.length,
          itemBuilder: (_, i) => MovieItemWidget(
            item: state.topRatedMovies[i],
          ),
        ),
      ),
    );
  }
}
