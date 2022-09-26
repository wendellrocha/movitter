import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'domain/entities/result_upcoming_movies.dart';
import 'domain/errors/errors.dart';
import 'upcoming_controller.dart';
import 'upcoming_store.dart';

class UpcomingPage extends StatefulWidget {
  final String title;
  const UpcomingPage({Key? key, this.title = 'Upcoming'}) : super(key: key);
  @override
  UpcomingPageState createState() => UpcomingPageState();
}

class UpcomingPageState extends State<UpcomingPage> {
  final UpcomingController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: ScopedBuilder<UpcomingStore, FailureUpcomingMovies,
          ResultUpcomingMovies>(
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
          itemCount: state.upcomingMovies.length,
          itemBuilder: (_, i) => MovieItemWidget(
            item: state.upcomingMovies[i],
          ),
        ),
      ),
    );
  }
}
