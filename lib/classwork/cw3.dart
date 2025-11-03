// create a program that reads list of expenses amount using user input and print total.
import 'dart:io';

void main() {
  List<double> expenses = [];
  double totalExpense = 0.0;

  print('Enter expense amounts (type "done" to finish):');

  while (true) {
    stdout.write('Enter amount: ');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'done') {
      break; // Exit loop if "done" or null input
    }

    try {
      double amount = double.parse(input);
      expenses.add(amount);
      totalExpense += amount;
    } catch (e) {
      print('Invalid input. Please enter a valid number or "done".');
    }
  }

  print('\n--- Expense Summary ---');
  if (expenses.isEmpty) {
    print('No expenses entered.');
  } else {
    print('Expenses: $expenses');
    print('Total Expense: \$${totalExpense.toStringAsFixed(2)}');
  }
}
