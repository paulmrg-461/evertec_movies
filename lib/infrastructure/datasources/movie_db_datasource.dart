import 'package:dio/dio.dart';
import 'package:evertec_movies/domain/datasources/movies_datasource.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/config/constants/environment.dart';

class MovieDbDatasource implements MoviesDatasource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: Environment.theMovieDbBaseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-US'
      }));

  @override
  Future<List<MovieEntity>> getUpcomingMovies({int page = 1}) async {
    final Response response = await dio.get('/movie/upcoming');
    final List<MovieEntity> movies = [];
    return movies;
  }
}
