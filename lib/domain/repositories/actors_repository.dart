import 'package:evertec_movies/domain/entities/entities.dart';

abstract class ActorsRepository {
  Future<List<ActorEntity>> getActorsByMovie(String movieId);
}
