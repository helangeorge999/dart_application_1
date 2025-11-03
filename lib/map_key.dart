void main() {
  Map cityCountry = Map<String, dynamic>();
  cityCountry['New York'] = 'USA';
  cityCountry['London'] = 'UK';
  cityCountry['Paris'] = 'France';
  cityCountry['Berlin'] = 'Germany';

  String searchValue = "London";
  print("$searchValue is in ${cityCountry[searchValue]}");
}
