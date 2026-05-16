import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentsGrades = [];

  int? numStudents;
  while (numStudents == null) {
    stdout.write('Enter the number of students: ');
    numStudents = int.tryParse(stdin.readLineSync()!);
    if (numStudents == null) print('Invalid input! Please enter a number.');
  }

  for (int i = 0; i < numStudents; i++) {
    print('\nStudent ${i + 1}');
    stdout.write('Enter student name: ');
    studentNames.add(stdin.readLineSync()!);

    int? numSubjects;
    while (numSubjects == null) {
      stdout.write('Enter number of subjects: ');
      numSubjects = int.tryParse(stdin.readLineSync()!);
      if (numSubjects == null) print('Invalid input!');
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      double? grade;
      while (grade == null) {
        stdout.write('Enter grade for subject ${j + 1}: ');
        grade = double.tryParse(stdin.readLineSync()!);
        if (grade == null) print('Invalid grade! Enter a number.');
      }
      grades.add(grade);
    }
    studentsGrades.add(grades);
  }

  while (true) {
    print('\nmenu');
    print('1. Show All Results');
    print('2. Search Student');
    print('3. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      showAllResults(studentNames, studentsGrades);
    } else if (choice == '2') {
      searchStudent(studentNames, studentsGrades);
    } else if (choice == '3') {
      print('Exiting program Goodbye!');
      break;
    } else {
      print('Invalid choice! Please try again.');
    }
  }
}

void showAllResults(List<String> names, List<List<double>> allGrades) {
  print('\n All Results');
  for (int i = 0; i < names.length; i++) {
    double sum = allGrades[i].reduce((a, b) => a + b);
    double avg = sum / allGrades[i].length;
    
    String letterGrade = getLetterGrade(avg);
    
    print('Name: ${names[i].toUpperCase()} | Average: ${avg.toStringAsFixed(2)} | Grade: $letterGrade');
  }
}

void searchStudent(List<String> names, List<List<double>> allGrades) {
  stdout.write('Enter name to search: ');
  String searchName = stdin.readLineSync()!.toLowerCase();
  bool found = false;

  for (int i = 0; i < names.length; i++) {
    if (names[i].toLowerCase() == searchName) {
      double sum = allGrades[i].reduce((a, b) => a + b);
      double avg = sum / allGrades[i].length;
      print('Result: ${names[i]} has an average of ${avg.round()}');
      found = true;
      break;
    }
  }
  if (!found) print('Student not found!');
}

String getLetterGrade(double avg) {
  if (avg >= 85) return 'A';
  if (avg >= 75) return 'B';
  if (avg >= 65) return 'C';
  return 'F';
}