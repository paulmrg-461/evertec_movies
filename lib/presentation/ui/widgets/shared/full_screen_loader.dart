import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading movies...',
      'Buying popcorn...',
      'Loading upcoming movies...',
      'Loading popular movies...',
      'This is taking longer than expected',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Evertec Movies App',
            style: textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 26),
            width: 136,
            height: 136,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/EvertecMovies.png',
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 26),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');

              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
