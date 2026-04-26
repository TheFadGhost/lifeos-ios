import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/database.dart';
import '../../../core/data/habit_repository.dart';

class HabitsUiState {
  final List<Habit> habits;
  final bool isLoading;

  HabitsUiState({required this.habits, this.isLoading = false});
}

final habitsProvider = StreamProvider<List<Habit>>((ref) {
  final repo = ref.watch(habitRepositoryProvider);
  return repo.watchAllHabits();
});
