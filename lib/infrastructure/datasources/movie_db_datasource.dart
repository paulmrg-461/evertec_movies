import 'package:dio/dio.dart';
import 'package:evertec_movies/domain/datasources/movies_datasource.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/config/constants/environment.dart';
import 'package:evertec_movies/infrastructure/mappers/movie_mapper.dart';
import 'package:evertec_movies/infrastructure/models/models.dart';

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

  @override
  Future<MovieEntity> getMovieById({String id = ''}) async {
    final Response response = await dio.get('/movie/$id');

    if (response.statusCode != 200)
      throw Exception('Movie with id: $id not found');

    final movieDetails = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(movieDetails);
  }

  @override
  Future<List<MovieEntity>> searchMoviesByName({String query = ''}) async {
    if (query.isEmpty || query == '') return [];

    final response =
        await dio.get('/search/movie', queryParameters: {'query': query});

    return _jsonToMovies(response.data);
  }
}
