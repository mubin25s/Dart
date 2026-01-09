void main() {
  // Integers and Doubles
  int age = 25;
  double height = 5.9;

  // Strings
  String name = 'Dart Developer';

  // Booleans
  bool isCoding = true;

  // Lists (Arrays)
  List<String> technologies = ['Dart', 'Flutter', 'Firebase'];

  // Maps (Key-Value pairs)
  Map<String, dynamic> stats = {
    'level': 1,
    'xp': 100,
    'online': true,
  };

  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('Is Coding: $isCoding');
  print('Technologies: ${technologies.join(', ')}');
  print('Stats: $stats');
}
