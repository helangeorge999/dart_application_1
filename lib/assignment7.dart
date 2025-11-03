//7. WAP to check whether a string is palindrome or not.
void checkStringPalindrome({required String text}) {
  String reversedText = text.split('').reversed.join('');

  if (text == reversedText) {
    print('"$text" is a palindrome.');
  } else {
    print('"$text" is not a palindrome.');
  }
}
