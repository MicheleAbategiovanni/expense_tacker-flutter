import 'package:expense_tacker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 15),
            Row(
              children: [
                Text('€${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 10),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
