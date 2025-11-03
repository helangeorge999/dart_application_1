void main() {
  List<int> arr = [];

  for (int i = 0; i < 10; i++) {
    arr.add(i + 1);
  }
  print(sumOfAnArray(arr: arr));
}

//Function
int sumOfAnArray({required List<int> arr}) {
  int sum = 0;

  for (int i in arr) {
    sum += i;
  }
  return sum;
}
