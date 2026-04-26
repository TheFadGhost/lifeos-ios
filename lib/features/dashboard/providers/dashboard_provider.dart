import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/habit_repository.dart';
import '../../../core/data/task_repository.dart';

class DashboardSummary {
  final int activeHabits;
  final int pendingTasks;

  DashboardSummary({required this.activeHabits, required this.pendingTasks});
}

final dashboardSummaryProvider = StreamProvider<DashboardSummary>((ref) async* {
  final habitRepo = ref.watch(habitRepositoryProvider);
  final taskRepo = ref.watch(taskRepositoryProvider);

  final habitsStream = habitRepo.watchAllHabits();
  final tasksStream = taskRepo.watchAllTasks();

  await for (final habits in habitsStream) {
    final tasks = await tasksStream.first;
    yield DashboardSummary(
      activeHabits: habits.length,
      pendingTasks: tasks.where((t) => !t.isCompleted).length,
    );
  }
});
