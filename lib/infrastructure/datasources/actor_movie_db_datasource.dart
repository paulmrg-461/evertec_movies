import 'package:dio/dio.dart';
import 'package:evertec_movies/config/constants/environment.dart';
import 'package:evertec_movies/domain/datasources/actors_datasource.dart';
import 'package:evertec_movies/domain/entities/entities.dart';
import 'package:evertec_movies/infrastructure/mappers/actor_mapper.dart';
import 'package:evertec_movies/infrastructure/models/models.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final Dio dio = Dio(BaseOptions(
      baseUrl: Environment.theMovieDbBaseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-US'
      }));

  @override
  Future<List<ActorEntity>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<ActorEntity> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
