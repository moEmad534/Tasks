abstract class Skills {
  void programming();
  void communication();
}

class Person {
  String name;
  int _age; 

  static String universityName = "Sohag University";

  Person(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Age must be positive!");
    }
  }
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

class Developer extends Employee implements Skills {
  
  Developer(String name, int age, double salary) : super(name, age, salary);

  @override
  void programming() {
    print("Programming skill: Dart developer");
  }

  @override
  void communication() {
    print("Communication skill: Good team communication");
  }
}

void main() {
  print("University: ${Person.universityName}");

  Developer dev = Developer("Ahmed", 25, 8000);

  dev.showInfo();
  dev.programming();
  dev.communication();
}