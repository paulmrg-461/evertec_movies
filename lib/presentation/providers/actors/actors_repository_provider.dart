import 'package:evertec_movies/infrastructure/datasources/actor_movie_db_datasource.dart';
import 'package:evertec_movies/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
