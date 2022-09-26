import 'package:flutter/material.dart';

import '../../constants/routes.dart';
import '../../models/movies.dart';

class MovieItemWidget extends StatelessWidget {
  final Movies item;
  const MovieItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final value = (item.voteAverage * 10).ceil();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      '$kAssetsBaseUrl/w500${item.posterPath}',
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          width: 30,
                          height: 30,
                          child: Stack(
                            children: [
                              CircularProgressIndicator(
                                value: item.voteAverage / 10,
                                backgroundColor: Colors.transparent,
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  progressColor,
                                ),
                                semanticsValue: '$value%',
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    '$value%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: Colors.white,
                                          fontSize: 8,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                item.title,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                item.releaseDate,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Color get progressColor {
    final value = (item.voteAverage * 10).ceil();

    if (value < 40) {
      return Colors.red;
    }

    if (value >= 40 && value < 70) {
      return Colors.yellow;
    }

    return Colors.green;
  }
}
