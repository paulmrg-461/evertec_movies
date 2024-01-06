import 'package:evertec_movies/domain/datasources/actors_datasource.dart';
import 'package:evertec_movies/domain/entities/entities.dart';
import 'package:evertec_movies/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<ActorEntity>> getActorsByMovie(String movieId) =>
      datasource.getActorsByMovie(movieId);
}
