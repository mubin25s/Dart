void main() {
  List<int> numbers = [12, 45, 2, 67, 34, 8, 91, 23];

  // 1. Sum of List
  int totalSum = numbers.reduce((value, element) => value + element);
  print('List of numbers: $numbers');
  print('Sum of numbers: $totalSum');

  // 2. Find Largest Element
  int maxNumber = numbers.reduce((curr, next) => curr > next ? curr : next);
  print('Largest number: $maxNumber');

  // 3. Filter Even Numbers
  List<int> evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evenNumbers');

  // 4. Map: Square each number
  List<int> squaredNumbers = numbers.map((n) => n * n).toList();
  print('Squared numbers: $squaredNumbers');
}
