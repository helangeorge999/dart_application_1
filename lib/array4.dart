import 'dart:math';

void main() {
  Random random = Random();
  List<int> numbers = [];

  // Generate 5 random numbers up to 100
  for (int i = 0; i < 5; i++) {
    numbers.add(random.nextInt(100)); // Generates numbers from 0 to 99
  }

  print("Generated numbers: $numbers");

  // Sort the list to find the second highest
  numbers.sort();

  // Find the second highest number
  if (numbers.length >= 2) {
    int secondHighest = numbers[numbers.length - 2];
    print("Sorted numbers: $numbers");
    print("Second highest number: $secondHighest");
  } else {
    print(
      "Cannot find the second highest number as there are less than 2 numbers.",
    );
  }
}
