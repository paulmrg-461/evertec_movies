import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<MovieEntity>>((ref) {
  final List<MovieEntity> upcomingMovies = ref.watch(upcomingMoviesProvider);
  if (upcomingMovies.isEmpty) return [];

  upcomingMovies.shuffle();

  return upcomingMovies.sublist(0, 8);
});
