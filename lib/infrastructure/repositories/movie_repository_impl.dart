import 'package:evertec_movies/domain/datasources/movies_datasource.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MovieRepositoryImpl({required this.moviesDatasource});
  @override
  Future<List<MovieEntity>> getUpcomingMovies({int page = 1}) =>
      moviesDatasource.getUpcomingMovies(page: page);

  @override
  Future<List<MovieEntity>> getPopularMovies({int page = 1}) =>
      moviesDatasource.getPopularMovies(page: page);
}
