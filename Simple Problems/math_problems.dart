void main() {
  // 1. Factorial Calculation
  int n = 5;
  int factorial = calculateFactorial(n);
  print('Factorial of $n is $factorial');

  // 2. Fibonacci Sequence
  int terms = 10;
  print('\nFibonacci sequence up to $terms terms:');
  for (int i = 0; i < terms; i++) {
    print(fibonacci(i));
  }

  // 3. Prime Number Check
  int num = 17;
  bool isPrimeNumber = checkPrime(num);
  print('\nIs $num prime? $isPrimeNumber');
}

int calculateFactorial(int n) {
  if (n <= 1) retu
  return n * calculateFactorial(n - 1);
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool checkPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
