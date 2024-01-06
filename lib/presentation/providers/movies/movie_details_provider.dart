import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, MovieEntity>>((ref) {
  final movieRepository = ref.watch(moviesRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<MovieEntity> Function({String id});

class MovieMapNotifier extends StateNotifier<Map<String, MovieEntity>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie({String movieId = ''}) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(id: movieId);
    state = {...state, movieId: movie};
  }
}
