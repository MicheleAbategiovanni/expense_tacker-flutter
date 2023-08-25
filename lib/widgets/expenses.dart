import 'package:expense_tacker/widgets/expenses_list/epenses_list.dart';
import 'package:expense_tacker/models/expense.dart';
import 'package:expense_tacker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _Expenses();
  }
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Courses',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 12.50,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openModalExpense() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpensesTracker'),
        actions: [
          IconButton(
            onPressed: _openModalExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Grafici'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}


//N.B = Column e ListView vanno in conflitto, bisogna associare ad esempio un expanded alla list