import 'package:dio/dio.dart';
import 'package:evertec_movies/domain/datasources/movies_datasource.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/config/constants/environment.dart';
import 'package:evertec_movies/infrastructure/mappers/movie_mapper.dart';
import 'package:evertec_movies/infrastructure/models/the_movie_db/movie_db_response.dart';

class MovieDbDatasource implements MoviesDatasource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: Environment.theMovieDbBaseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-US'
      }));

  List<MovieEntity> _jsonToMovies(Map<String, dynamic> json) {
    final MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(json);
    final List<MovieEntity> movies = movieDbResponse.results
        .map((e) => MovieMapper.movieDbToEntity(e))
        .toList();
    return movies;
  }

  @override
  Future<List<MovieEntity>> getUpcomingMovies({int page = 1}) async {
    final Response response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<MovieEntity>> getPopularMovies({int page = 1}) async {
    final Response response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }
}
