import 'package:evertec_movies/config/router/app_router.dart';
import 'package:evertec_movies/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Evertec Movies',
      theme: AppTheme().getTheme(),
    );
  }
}
