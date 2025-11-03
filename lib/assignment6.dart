// 6. WAP to check whether a number is palindrome or not.
void checkPalindrome({required int number}) {
  int originalNumber = number;
  int reversedNumber = 0;

  while (number > 0) {
    int digit = number % 10;
    reversedNumber = reversedNumber * 10 + digit;
    number ~/= 10;
  }

  if (originalNumber == reversedNumber) {
    print("$originalNumber is a palindrome.");
  } else {
    print("$originalNumber is not a palindrome.");
  }
}
