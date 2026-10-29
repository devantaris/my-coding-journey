import 'dart:io';

void main() {
  // This is a simple Dart program that prints "Hello, World!" to the console.
  print('Hello, World!');

  // You can also read input from the user.
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  if (name != null && name.isNotEmpty) {
    print('Hello, $name!');
  } else {
    print('Hello, stranger!');
  }
  Human();//creating new object of a class

}
class Human{
  Human();
}