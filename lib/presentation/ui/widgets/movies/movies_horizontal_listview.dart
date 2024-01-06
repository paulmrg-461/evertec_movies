import 'package:animate_do/animate_do.dart';
import 'package:evertec_movies/config/helpers/human_formats.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesHorizontalListView extends StatelessWidget {
  final List<MovieEntity> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 370,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Header(
              title: title,
              subtitle: subtitle,
            ),
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (loadNextPage != null &&
                  scrollNotification is ScrollEndNotification &&
                  scrollNotification.metrics.extentAfter == 0) {
                loadNextPage!();
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (context, index) =>
                  _Slide(movieEntity: movies[index]),
            ),
          ))
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const _Header({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title != null
              ? Text(
                  title!,
                  style: textTheme.titleLarge,
                )
              : const Spacer(),
          subtitle != null
              ? FilledButton.tonal(
                  style:
                      const ButtonStyle(visualDensity: VisualDensity.compact),
                  onPressed: () {},
                  child: Text(subtitle!))
              : const Spacer()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final MovieEntity movieEntity;
  const _Slide({required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                movieEntity.posterPath,
                width: 160,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    (loadingProgress != null)
                        ? const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black12))
                        : GestureDetector(
                            onTap: () =>
                                context.push('/movie-detail/${movieEntity.id}'),
                            child: FadeIn(child: child)),
              ),
            ),
          ),
          Container(
              width: 160,
              margin: const EdgeInsets.only(top: 6),
              child: Text(
                movieEntity.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.titleSmall,
              )),
          SizedBox(
            width: 160,
            child: Row(
              children: [
                const Icon(
                  Icons.star_half_rounded,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  (movieEntity.voteAverage).toStringAsFixed(1),
                  style: textTheme.titleSmall?.copyWith(color: Colors.amber),
                ),
                const Spacer(),
                Text(
                  HumanFormat.number(movieEntity.popularity),
                  style: textTheme.titleSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
