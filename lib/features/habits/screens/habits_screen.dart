import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/habits_provider.dart';
import '../../../core/ui/components.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
      ),
      body: habitsAsync.when(
        data: (habits) {
          if (habits.isEmpty) {
            return const Center(child: Text('No habits yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LifeOsCard(
                  child: ListTile(
                    title: Text(habit.name),
                    subtitle: Text(habit.frequency),
                    trailing: Checkbox.adaptive(
                      value: false, // TODO: bind to habit log
                      onChanged: (val) {},
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add habit
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
