import 'package:flutter/material.dart';
import 'package:harcama_takip/widget/expenses_list/expenses_list.dart';
import 'package:harcama_takip/models/expense.dart';
import 'package:harcama_takip/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Kurs',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.Calisma,
    ),
    Expense(
      title: 'Sinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.Eglence,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Harcama Silindi'),
        action: SnackBarAction(
            label: 'Geri Al',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(
                  expenseIndex,
                  expense,
                );
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Harcama bulunamadı. Giderleri gir'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Harcama Takip Uygulaması'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          )
        ],
      ),
      body: Column(
        children: [
          //Toolbar with the Add Button => Row()
          const Text('The chart'),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
