import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import 'reminder_repository.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return TaskRepository(db);
});

class TaskRepository {
  final LifeOsDatabase _db;

  TaskRepository(this._db);

  Stream<List<Task>> watchAllTasks() {
    return _db.select(_db.tasks).watch();
  }

  Future<int> addTask(TasksCompanion task) {
    return _db.into(_db.tasks).insert(task);
  }

  Future<void> updateTask(Task task) {
    return _db.update(_db.tasks).replace(task);
  }

  Future<void> deleteTask(int id) {
    return (_db.delete(_db.tasks)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<TaskFolder>> watchAllFolders() {
    return _db.select(_db.taskFolders).watch();
  }

  Future<int> addFolder(TaskFoldersCompanion folder) {
    return _db.into(_db.taskFolders).insert(folder);
  }
}
