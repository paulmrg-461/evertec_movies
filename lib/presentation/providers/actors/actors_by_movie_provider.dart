import 'package:evertec_movies/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evertec_movies/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier,
    Map<String, List<ActorEntity>>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<ActorEntity>> Function(String movieId);

class ActorsByMovieNotifier
    extends StateNotifier<Map<String, List<ActorEntity>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<ActorEntity> actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
