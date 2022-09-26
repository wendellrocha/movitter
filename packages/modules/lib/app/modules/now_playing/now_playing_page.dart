import 'package:common/common.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'domain/entities/result_movies_now_playing.dart';
import 'domain/errors/errors.dart';
import 'now_playing_controller.dart';
import 'now_playing_store.dart';

class NowPlayingPage extends StatefulWidget {
  final String title;
  const NowPlayingPage({Key? key, this.title = 'Now Playing'})
      : super(key: key);

  @override
  NowPlayingPageState createState() => NowPlayingPageState();
}

class NowPlayingPageState extends State<NowPlayingPage> {
  final NowPlayingController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.getMoviesNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: widget.title),
      body: ScopedBuilder<NowPlayingStore, FailureMoviesNowPlaying,
          ResultMoviesNowPlaying>(
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
          itemCount: state.moviesNowPlaying.length,
          itemBuilder: (_, i) => MovieItemWidget(
            item: state.moviesNowPlaying[i],
          ),
        ),
      ),
    );
  }
}
