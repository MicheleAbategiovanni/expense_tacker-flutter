import 'package:expense_tacker/models/expense.dart';
import 'package:expense_tacker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

//ListView.builder => il Builder ci permette di specificare a Flutter
// che creerà gli elementi solo quando stanno per essere visualizzati
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (cnt, index) => ExpenseItem(expenses[index]),
    );
  }
}
