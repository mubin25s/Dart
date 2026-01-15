void main() {
  print('====================================');
  print('🚀 Welcome to the Dart World!');
  print('====================================');

  final programmer = Programmer(name: 'VS Code', language: 'Dart');
  programmer.introduce();

  print('------------------------------------');
  print('Current Status: System Online');
  print('====================================');
}

class Programmer {
  final String name;
  final String language;

  Programmer({required this.name, required this.language});

  void introduce() {
    print('Hello! I am $name, and I am coding in $language.');
  }
}
