import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(upcomingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<MovieEntity> upcomingMovies = ref.watch(upcomingProvider);
    return ListView.builder(
      itemCount: upcomingMovies.length,
      itemBuilder: (context, index) {
        final MovieEntity upcomingMovie = upcomingMovies[index];
        return ListTile(
          title: Text(upcomingMovie.title),
          subtitle: Text(
            upcomingMovie.overview,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        );
      },
    );
  }
}
