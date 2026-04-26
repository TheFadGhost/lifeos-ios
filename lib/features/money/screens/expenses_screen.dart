import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/data/expense_repository.dart';
import '../../../core/ui/components.dart';

final expensesProvider = StreamProvider((ref) {
  final repo = ref.watch(expenseRepositoryProvider);
  return repo.watchAllExpenses();
});

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money'),
      ),
      body: expensesAsync.when(
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(child: Text('No expenses yet.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: LifeOsCard(
                  child: ListTile(
                    title: Text('\$${expense.amount.toStringAsFixed(2)}'),
                    subtitle: expense.description != null ? Text(expense.description!) : null,
                    trailing: Text(
                      '${expense.date.day}/${expense.date.month}/${expense.date.year}',
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add expense
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
