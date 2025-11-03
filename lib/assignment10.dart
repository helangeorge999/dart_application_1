//10. WAP to store ten numbers in an array and find the second highest number.
void findSecondHighest({required List<int> numbers}) {
  if (numbers.length < 2) {
    print("Array must contain at least two elements.");
    return;
  }

  int highest = numbers[0];
  int secondHighest = double.negativeInfinity.toInt();

  for (int number in numbers) {
    if (number > highest) {
      secondHighest = highest;
      highest = number;
    } else if (number > secondHighest && number != highest) {
      secondHighest = number;
    }
  }

  if (secondHighest == double.negativeInfinity.toInt()) {
    print("There is no second highest number.");
  } else {
    print("The second highest number is $secondHighest.");
  }
}