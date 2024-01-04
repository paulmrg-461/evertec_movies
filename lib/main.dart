import 'package:evertec_movies/config/theme/app_theme.dart';
import 'package:evertec_movies/presentation/ui/screens/movies/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evertec Movies',
      theme: AppTheme().getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Evertec Movies'),
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
