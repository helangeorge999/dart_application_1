//8. WAP to calculate the BMI.
void calculateBMI({required double weight, required double height}) {
  double bmi = weight / (height * height);

  print("Your BMI is ${bmi.toStringAsFixed(2)}.");

  if (bmi < 18.5) {
    print("You are underweight.");
  } else if (bmi >= 18.5 && bmi < 24.9) {
    print("You have a normal weight.");
  } else if (bmi >= 25 && bmi < 29.9) {
    print("You are overweight.");
  } else {
    print("You are obese.");
  }
}
