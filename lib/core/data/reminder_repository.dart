import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import '../notifications/reminder_scheduler.dart';

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ReminderRepository(db);
});

class ReminderRepository {
  final LifeOsDatabase _db;

  ReminderRepository(this._db);

  Stream<List<Reminder>> watchAllReminders() {
    return _db.select(_db.reminders).watch();
  }

  Future<int> addReminder(RemindersCompanion reminder) async {
    final id = await _db.into(_db.reminders).insert(reminder);
    final inserted = await (_db.select(_db.reminders)..where((t) => t.id.equals(id))).getSingle();
    
    await ReminderScheduler.scheduleReminder(
      id: inserted.id,
      title: inserted.title,
      body: inserted.description ?? '',
      scheduledTime: inserted.time,
    );
    
    return id;
  }

  Future<void> updateReminder(Reminder reminder) async {
    await _db.update(_db.reminders).replace(reminder);
    
    if (reminder.isCompleted) {
      await ReminderScheduler.cancelReminder(reminder.id);
    } else {
      await ReminderScheduler.scheduleReminder(
        id: reminder.id,
        title: reminder.title,
        body: reminder.description ?? '',
        scheduledTime: reminder.time,
      );
    }
  }

  Future<void> deleteReminder(int id) async {
    await (_db.delete(_db.reminders)..where((t) => t.id.equals(id))).go();
    await ReminderScheduler.cancelReminder(id);
  }
}
