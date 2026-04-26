import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import 'database.dart';

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return HabitRepository(db);
});

class HabitRepository {
  final LifeOsDatabase _db;

  HabitRepository(this._db);

  Stream<List<Habit>> watchAllHabits() {
    return _db.select(_db.habits).watch();
  }

  Future<int> addHabit(HabitsCompanion habit) {
    return _db.into(_db.habits).insert(habit);
  }

  Future<void> updateHabit(Habit habit) {
    return _db.update(_db.habits).replace(habit);
  }

  Future<void> deleteHabit(int id) {
    return (_db.delete(_db.habits)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<HabitLog>> watchHabitLogs(int habitId) {
    return (_db.select(_db.habitLogs)..where((t) => t.habitId.equals(habitId))).watch();
  }

  Future<void> logHabit(int habitId, DateTime date, bool completed) async {
    final existing = await (_db.select(_db.habitLogs)
          ..where((t) => t.habitId.equals(habitId) & t.date.equals(date)))
        .getSingleOrNull();

    if (existing != null) {
      await _db.update(_db.habitLogs).replace(
            existing.copyWith(completed: completed),
          );
    } else {
      await _db.into(_db.habitLogs).insert(
            HabitLogsCompanion.insert(
              habitId: habitId,
              date: date,
              completed: Value(completed),
            ),
          );
    }
  }
}
