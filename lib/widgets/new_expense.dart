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
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(prefixText: '€', label: Text('Amount')),
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
