import 'package:expense_tacker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importa questa libreria

void main() {
  initializeDateFormatting().then((_) {
    runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const Expenses(),
      ),
    );
  });
}
