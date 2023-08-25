import 'package:expense_tacker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // Questo è un approccio manuale su tutti gli input che avremmo a disposizione
  // var _newExpenseTitle = '';
  // void newExpense(String inputValue) {
  //   _newExpenseTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    // Questo metodo viene chiamato quando il widget viene distrutto.
    // È il posto giusto per rilasciare risorse, chiudere stream, controller, ecc.

    _titleController
        .dispose(); // Qui stai chiudendo il controller _titleController.

    _amountController.dispose();

    super
        .dispose(); // Chiama il metodo dispose della superclasse per effettuare ulteriori pulizie.
  }

// Bisogna aggiungere un nuovo campo di input numerico in un nuova col separata
// Aggiungere un nuovo Button x annullare le modifichye e chiudere la modale

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '€', label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No Selected Date'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _datePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.value);
                  },
                  child: const Text('Save Expense')),
              const Padding(
                padding: EdgeInsets.only(right: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Dismiss')),
            ],
          )
        ],
      ),
    );
  }
}
