// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:student_database_bloc/db/model/data_model.dart';

// ValueNotifier<List<StudentModel>> StudentListNotifier = ValueNotifier([]);

// Future<void> addStudent(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final _id = await studentDB.add(value);
//   value.id = _id;
//   StudentListNotifier.value.add(value);
//   StudentListNotifier.notifyListeners();
// }

// Future<void> getAllStudents() async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   StudentListNotifier.value.clear();
//   StudentListNotifier.value.addAll(studentDB.values);
//   StudentListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int index) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   await studentDB.deleteAt(index);
  
//   getAllStudents();
// }
