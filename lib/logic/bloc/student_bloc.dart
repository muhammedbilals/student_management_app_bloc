import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:student_database_bloc/db/model/boxes.dart';
import 'package:student_database_bloc/db/model/data_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<FetchAllData>((event, emit) {
      try {
        final studnetdata = StudentBox.getStudentData();
        List<StudentModel> students = studnetdata.values.toList();
        emit(DisplayAllStudents(students));
        // add(FetchAllData());
        // print(students.length);
      } catch (e) {
        print(e);
      }
    });
    on<AddData>((event, emit) {
      try {
        final studentbox = StudentBox.getStudentData();
        studentbox.add(event.studentdata);
        add(FetchAllData());
      } catch (e) {
        print(e);
      }
    });
    // on<FetchSpecificData>((event, emit) {
    //   try {
    //     final studentdata = StudentBox.getStudentData();
    //     StudentModel student = studentdata.values.;
    //   } catch (e) {}
    // });
  }
}
