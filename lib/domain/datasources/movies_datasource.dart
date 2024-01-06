import 'package:evertec_movies/domain/entities/movie_entity.dart';

abstract class MoviesDatasource {
  Future<List<MovieEntity>> getUpcomingMovies({int page = 1});
  Future<List<MovieEntity>> getPopularMovies({int page = 1});
  Future<MovieEntity> getMovieById({String id = ''});
  Future<List<MovieEntity>> searchMoviesByName({String query = ''});
}
