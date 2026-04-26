import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/database.dart';
import '../../../core/data/task_repository.dart';

class TasksUiState {
  final List<Task> tasks;
  final List<TaskFolder> folders;
  final bool isLoading;

  TasksUiState({
    required this.tasks,
    required this.folders,
    this.isLoading = false,
  });
}

final tasksProvider = StreamProvider<List<Task>>((ref) {
  final repo = ref.watch(taskRepositoryProvider);
  return repo.watchAllTasks();
});

final taskFoldersProvider = StreamProvider<List<TaskFolder>>((ref) {
  final repo = ref.watch(taskRepositoryProvider);
  return repo.watchAllFolders();
});
