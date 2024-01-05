import 'package:evertec_movies/infrastructure/datasources/movie_db_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Read only repository
final moviesRepositoryProvider = Provider((ref) => MovieDbDatasource());
