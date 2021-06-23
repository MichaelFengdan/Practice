
class Person {
  final String name;

  Person(this.name);
}

extension StringExtension on String {
  int toInt() {
    return int.parse(this);
  }
}

