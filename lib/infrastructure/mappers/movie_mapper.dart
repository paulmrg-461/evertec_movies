import 'package:evertec_movies/config/constants/environment.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/infrastructure/models/the_movie_db/movie_movie_db.dart';

class MovieMapper {
  static MovieEntity movieDbToEntity(MovieMovieDB movieDB) => MovieEntity(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : Environment.movieNotFoundImage,
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : Environment.movieNotFoundImage,
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
