import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:evertec_movies/domain/entities/movie_entity.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<MovieEntity> movies;

  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 210,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.85,
        autoplay: true,
        itemCount: movies.length,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                size: 6,
                activeSize: 8,
                space: 2,
                activeColor: colors.primary,
                color: colors.secondary)),
        itemBuilder: (context, index) => _ItemCard(movie: movies[index]),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final MovieEntity movie;
  const _ItemCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 10, offset: Offset(0, 8))
        ]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: DecoratedBox(
        decoration: boxDecoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            movie.backdropPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress != null)
                    ? const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12))
                    : FadeIn(child: child),
          ),
        ),
      ),
    );
  }
}
