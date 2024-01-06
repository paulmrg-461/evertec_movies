import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/delegates/search_movie_delegate.dart';
import 'package:evertec_movies/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
        bottom: false,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.movie_filter_outlined,
                color: colors.primary,
              ),
            ),
            Text('Evertec Movies', style: textTheme.titleMedium),
            const Spacer(),
            IconButton(
                onPressed: () {
                  final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<MovieEntity?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchMovieDelegate(
                              initialMovies: searchedMovies,
                              searchMovies: ref
                                  .read(searchedMoviesProvider.notifier)
                                  .searchMoviesByQuery))
                      .then((movie) {
                    if (movie == null) return;

                    context.push('/movie-detail/${movie.id}');
                  });
                },
                icon: const Icon(Icons.search_rounded))
          ],
        ));
  }
}
