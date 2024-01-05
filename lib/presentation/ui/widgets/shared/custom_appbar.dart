import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
        bottom: false,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.movie_filter_outlined,
                color: colors.primary,
              ),
            ),
            Text('Evertec Movies', style: textTheme.titleMedium),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
        ));
  }
}
