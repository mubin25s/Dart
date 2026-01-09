void main() {
  greet('Antigravity');
  
  int sum = add(10, 20);
  print('Sum: $sum');

  describePerson(name: 'Alice', age: 30);
  
  print('Square of 5: ${calculateSquare(5)}');
}

// Basic function
void greet(String name) {
  print('Hello, $name! Welcome to Dart functions.');
}

// Function with return type
int add(int a, int b) {
  return a + b;
}

// Function with named parameters
void describePerson({required String name, int? age}) {
  print('Person: $name, Age: ${age ?? 'Unknown'}');
}

// Arrow function syntax for simple expressions
int calculateSquare(int n) => n * n;
