import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'domain/entities/result_trending_movies.dart';
import 'domain/errors/errors.dart';
import 'trending_controller.dart';
import 'trending_store.dart';

class TrendingPage extends StatefulWidget {
  final String title;
  const TrendingPage({Key? key, this.title = 'Trending'}) : super(key: key);
  @override
  TrendingPageState createState() => TrendingPageState();
}

class TrendingPageState extends State<TrendingPage> {
  final TrendingController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getTredingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: ScopedBuilder<TrendingStore, FailureTrendingMovies,
          ResultTrendingMovies>(
        store: controller.store,
        onLoading: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onError: (context, error) => Center(
          child: Text(error!.message),
        ),
        onState: (context, state) => ListView.builder(
          itemCount: state.trendingMovies.length,
          itemBuilder: (_, i) => Text(
            state.trendingMovies[i].title,
          ),
        ),
      ),
    );
  }
}
