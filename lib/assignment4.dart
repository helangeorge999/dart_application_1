//4. WAP to calculate the sum of even number of 1 to 100.
void sumOfEvenNumbers() {
  int sum = 0;
  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      sum += i;
    }
  }
  print("The sum of even numbers from 1 to 100 is $sum.");
}
