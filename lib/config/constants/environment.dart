import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbBaseUrl = 'https://api.themoviedb.org/3';
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_API'] ?? 'API Key not found';

  static String movieNotFoundImage =
      'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png';
}
