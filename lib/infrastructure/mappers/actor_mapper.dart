import 'package:evertec_movies/domain/entities/entities.dart';

import '../models/the_movie_db/credits_response.dart';

class ActorMapper {
  static ActorEntity castToEntity(Cast cast) => ActorEntity(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
        character: cast.character,
      );
}
