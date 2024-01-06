import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:evertec_movies/domain/entities/movie_entity.dart';
import 'package:evertec_movies/presentation/providers/providers.dart';
import 'package:evertec_movies/presentation/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    final List<MovieEntity> slideShowMovies =
        ref.watch(moviesSlideshowProvider);
    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideShow(
          movies: slideShowMovies,
        ),
        MoviesHorizontalListView(
          movies: upcomingMovies,
          title: 'Upcoming',
          subtitle: 'Movies',
          loadNextPage: () {
            print('tola');
          },
        )
      ],
    );
  }
}
