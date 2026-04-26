import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FitnessScreen extends ConsumerWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness'),
      ),
      body: const Center(
        child: Text('Fitness View (Coming Soon)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add workout
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
