import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';

final csvExporterProvider = Provider<CsvExporter>((ref) {
  final db = ref.watch(databaseProvider);
  return CsvExporter(db);
});

class CsvExporter {
  final LifeOsDatabase _db;

  CsvExporter(this._db);

  Future<String> exportTasksToCsv() async {
    final tasks = await _db.select(_db.tasks).get();
    final buffer = StringBuffer();
    
    // Header
    buffer.writeln('id,title,description,folderId,dueDate,isCompleted,priority');
    
    // Rows
    for (final task in tasks) {
      buffer.writeln(
        '${task.id},"${task.title}","${task.description ?? ''}",${task.folderId ?? ''},${task.dueDate?.toIso8601String() ?? ''},${task.isCompleted},${task.priority}',
      );
    }
    
    return buffer.toString();
  }

  Future<String> exportHabitsToCsv() async {
    final habits = await _db.select(_db.habits).get();
    final buffer = StringBuffer();
    
    // Header
    buffer.writeln('id,name,description,frequency,targetDays,color');
    
    // Rows
    for (final habit in habits) {
      buffer.writeln(
        '${habit.id},"${habit.name}","${habit.description ?? ''}","${habit.frequency}",${habit.targetDays},"${habit.color ?? ''}"',
      );
    }
    
    return buffer.toString();
  }

  // Add other tables as needed
}
