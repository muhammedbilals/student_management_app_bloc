import 'package:student_database_bloc/db/model/data_model.dart';
import 'package:hive/hive.dart';

class StudentBox{
  
  static Box<StudentModel> getStudentData()=>
    Hive.box<StudentModel>('student_db');
  
}