import 'package:evertec_movies/domain/entities/entities.dart';

abstract class ActorsDatasource {
  Future<List<ActorEntity>> getActorsByMovie(String movieId);
}
