import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// Uuid libreria esterna per creare degli ID
const uuid = Uuid();

final formatter = DateFormat.yMd();

// un insieme ben definito di costanti
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.airplanemode_on_sharp,
  Category.leisure: Icons.movie_filter_sharp,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
