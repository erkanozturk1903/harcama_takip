import 'package:flutter/material.dart';
import 'package:harcama_takip/widget/expenses.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: const Expenses(),
  ));
}
