//9. WAP to store ten numbers in an array and display the sum of all.
void sumOfArray({required List<int> numbers}) {
  int sum = 0;
  for (int number in numbers) {
    sum += number;
  }
  print("The sum of the array elements is $sum.");
}
