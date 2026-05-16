Set<String> students = {};

void addStudent(String name) {
  students.add(name);
}


void printStudentsRecursive(List<String> namesList, int index) {
  if (index >= namesList.length) return; 
  print('Student (Recursive): ${namesList[index]}');
  printStudentsRecursive(namesList, index + 1);
}

void main() {
  addStudent('Ahmed');
  addStudent('Sara');
  addStudent('Ahmed');

  print('Printing using forEach');
  students.forEach((name) => print('Student: $name'));


  Set<String> newStudents = {'Omar', 'Mariam'};
  students = {...students, ...newStudents};
  
  print('\nAfter Merging');
  print(students);
  

  print('\nRecursive Output');
  printStudentsRecursive(students.toList(), 0);

  //----------------------------------------------
  // part two
  manageCourses();
}

Map<String, List<double>> studentGrades = {};


void addCourse(String studentName, String courseName, [double grade = 0]) {

  studentGrades.putIfAbsent(studentName, () => []);
  studentGrades[studentName]!.add(grade);
  print('Added $courseName with grade $grade for $studentName');
}

double averageGrade(String studentName) {
  List<double>? grades = studentGrades[studentName];
  
  if (grades == null || grades.isEmpty) return 0.0;

  double total = grades.reduce((value, element) => value + element);
  return total / grades.length;
}

void manageCourses() {
  print('\nPart 2: Courses');
  addCourse('Ahmed', 'Dart', 90);
  addCourse('Ahmed', 'UI/UX');
  addCourse('Sara', 'Data Science', 85);

  print('Average for Ahmed: ${averageGrade('Ahmed')}');
  print('Average for Sara: ${averageGrade('Sara')}');
}