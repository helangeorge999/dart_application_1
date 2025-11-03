import 'dart:math';

void main() {
  var rng = Random();

  print("Generating 5 random numbers up to 100:");
  for (int i = 0; i < 5; i++) {
    int randomNumber = rng.nextInt(101);
    print(randomNumber);
  }
}
