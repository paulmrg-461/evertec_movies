import 'package:evertec_movies/config/constants/environment.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/infrastructure/models/models.dart';

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

  static MovieEntity movieDetailsToEntity(MovieDetails movieDetails) =>
      MovieEntity(
          adult: movieDetails.adult,
          backdropPath: (movieDetails.backdropPath != '')
              ? 'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}'
              : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
          genreIds: movieDetails.genres.map((e) => e.name).toList(),
          id: movieDetails.id,
          originalLanguage: movieDetails.originalLanguage,
          originalTitle: movieDetails.originalTitle,
          overview: movieDetails.overview,
          popularity: movieDetails.popularity,
          posterPath: (movieDetails.posterPath != '')
              ? 'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}'
              : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
          releaseDate: movieDetails.releaseDate,
          title: movieDetails.title,
          video: movieDetails.video,
          voteAverage: movieDetails.voteAverage,
          voteCount: movieDetails.voteCount);
}
