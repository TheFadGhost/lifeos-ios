import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tables.dart';

part 'database.g.dart';

final databaseProvider = Provider<LifeOsDatabase>((ref) {
  return LifeOsDatabase();
});

@DriftDatabase(tables: [
  Settings,
  Reminders,
  Attachments,
  Habits,
  HabitLogs,
  TaskFolders,
  Tags,
  Tasks,
  TaskTags,
  Events,
  ExpenseCategories,
  Expenses,
  MuscleGroups,
  Exercises,
  WorkoutSessions,
  WorkoutSets,
  JournalEntries,
  ReadingItems,
])
class LifeOsDatabase extends _$LifeOsDatabase {
  LifeOsDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedData();
      },
    );
  }

  Future<void> _seedData() async {
    await batch((batch) {
      batch.insertAll(expenseCategories, [
        ExpenseCategoriesCompanion.insert(name: 'Food', color: const Value('#FF5722'), icon: const Value('restaurant')),
        ExpenseCategoriesCompanion.insert(name: 'Transport', color: const Value('#2196F3'), icon: const Value('directions_car')),
        ExpenseCategoriesCompanion.insert(name: 'Entertainment', color: const Value('#9C27B0'), icon: const Value('movie')),
      ]);
      batch.insertAll(muscleGroups, [
        MuscleGroupsCompanion.insert(name: 'Chest'),
        MuscleGroupsCompanion.insert(name: 'Back'),
        MuscleGroupsCompanion.insert(name: 'Legs'),
        MuscleGroupsCompanion.insert(name: 'Arms'),
        MuscleGroupsCompanion.insert(name: 'Shoulders'),
        MuscleGroupsCompanion.insert(name: 'Core'),
      ]);
      batch.insertAll(taskFolders, [
        TaskFoldersCompanion.insert(name: 'Personal', color: const Value('#4CAF50')),
        TaskFoldersCompanion.insert(name: 'Work', color: const Value('#FF9800')),
      ]);
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lifeos.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
