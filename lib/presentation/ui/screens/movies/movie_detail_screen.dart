import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  static const name = 'movie-detail-screen';

  final String movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieId),
      ),
    );
  }
}
