import 'package:evertec_movies/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getUpcomingMovies({int page = 1});
}