import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbBaseUrl = 'https://api.themoviedb.org/3';
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_API'] ?? 'API Key not found';
}
