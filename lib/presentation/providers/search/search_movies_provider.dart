import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<MovieEntity>>((ref) {
  final movieRepository = ref.read(moviesRepositoryProvider);

  return SearchedMoviesNotifier(
      searchMovies: movieRepository.searchMoviesByName, ref: ref);
});

typedef SearchMoviesCallback = Future<List<MovieEntity>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<MovieEntity>> searchMoviesByQuery(String query) async {
    final List<MovieEntity> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}
