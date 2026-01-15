void main() {
  var myDog = Dog('Buddy', 'Golden Retriever');
  myDog.makeSound();
  myDog.describe();

  var myCat = Cat('Whiskers');
  myCat.makeSound();
}

// Abstract class (Base class)
abstract class Animal {
  String name;
  Animal(this.name);

  void makeSound(); // Abstract method

  void describe() {
    print('This is $name.');
  }
}

// Inheritance
class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('$name says: Woof! Woof!');
  }

  @override
  void describe() {
    super.describe();
    print('It is a $breed.');
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Meow!');
  }
}
=======
void main() {
  var myDog = Dog('Buddy', 'Golden Retriever');
  myDog.makeSound();
  myDog.describe();

  var myCat = Cat('Whiskers');
  myCat.makeSound();
}

// Abstract class (Base class)
abstract class Animal {
  String name;
  Animal(this.name);

  void makeSound(); // Abstract method

  void describe() {
    print('This is $name.');
  }
}

// Inheritance
class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void makeSound() {
    print('$name says: Woof! Woof!');
  }

  @override
  void describe() {
    super.describe();
    print('It is a $breed.');
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Meow!');
  }
}
>>>>>>> 636d077d90e1125fefef891e0330dd428dcfd309
