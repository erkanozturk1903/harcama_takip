// ignore_for_file: constant_identifier_names

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { Yemek, Seyahat, Eglence, Calisma }

const categoryIcons = {
  Category.Yemek: Icons.lunch_dining,
  Category.Seyahat: Icons.flight_takeoff,
  Category.Eglence: Icons.movie,
  Category.Calisma: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}
