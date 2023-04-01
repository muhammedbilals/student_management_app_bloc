part of 'student_bloc.dart';

@immutable
abstract class StudentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllData extends StudentEvent {
  FetchAllData();
}

class AddData extends StudentEvent {
  final StudentModel studentdata;

  AddData(this.studentdata);
}

class FetchSpecificData extends StudentEvent {
  FetchSpecificData();
}
