import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchCounterState = ref.watch(fetchCounterProvider);

    final multipliedCounterState = ref.watch(multipliedCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod FutureProvider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///
            fetchCounterState.when(
              data: (counter) => Text('Counter: $counter'),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),

            ///
            multipliedCounterState.when(
              data: (multipliedCounter) =>
                  Text('Multiplied Counter: $multipliedCounter'),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),

            ///
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(fetchCounterProvider);
              },
              child: const Text('Refresh Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
