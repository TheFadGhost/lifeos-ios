import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';
import 'reminder_repository.dart';

final expenseRepositoryProvider = Provider<ExpenseRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ExpenseRepository(db);
});

class ExpenseRepository {
  final LifeOsDatabase _db;

  ExpenseRepository(this._db);

  Stream<List<Expense>> watchAllExpenses() {
    return _db.select(_db.expenses).watch();
  }

  Future<int> addExpense(ExpensesCompanion expense) {
    return _db.into(_db.expenses).insert(expense);
  }

  Future<void> updateExpense(Expense expense) {
    return _db.update(_db.expenses).replace(expense);
  }

  Future<void> deleteExpense(int id) {
    return (_db.delete(_db.expenses)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<ExpenseCategory>> watchAllCategories() {
    return _db.select(_db.expenseCategories).watch();
  }

  Future<int> addCategory(ExpenseCategoriesCompanion category) {
    return _db.into(_db.expenseCategories).insert(category);
  }
}
