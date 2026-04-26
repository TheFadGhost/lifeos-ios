import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JournalScreen extends ConsumerWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
      ),
      body: const Center(
        child: Text('Journal View (Coming Soon)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add entry
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
