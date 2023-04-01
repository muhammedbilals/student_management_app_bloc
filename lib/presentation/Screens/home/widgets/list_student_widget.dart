import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_database_bloc/logic/bloc/student_bloc.dart';
import 'package:student_database_bloc/presentation/Screens/edit_screen.dart';
import 'package:student_database_bloc/presentation/Screens/home/widgets/detailed_list_student.dart';
import 'package:student_database_bloc/db/functions/db_functions.dart';
import 'package:student_database_bloc/db/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentInitial) {
          context.read<StudentBloc>().add(FetchAllData());
        }
        if (state is DisplayAllStudents) {
          if (state.Students.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                // final data = state[index];
                return ListTile(
                  // leading image circle----------------------------------------
                  // leading: CircleAvatar(
                  //   radius: 20,
                  //   backgroundImage: FileImage(File(state.Students[index].image)),
                  // ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                            student: StudentModel(
                                name: state.Students[index].name,
                                age: state.Students[index].age,
                                domain: state.Students[index].domain,
                                Number: state.Students[index].Number,
                                image: state.Students[index].image)),
                      ),
                    );
                  },
                  title: Text(state.Students[index].name),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         EditScreen(index: index, data: data),
                          //   ),
                          // );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: AlertDialog(
                                    title: Text('Do you Want to Delete?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (state.Students[index] != null) {
                                            deleteStudent(index);
                                            Navigator.pop(context);
                                          } else {
                                            print('student id is null');
                                          }
                                        },
                                        child: Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('No'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: state.Students.length,
            );
          }
        }
        return Center(
          child: Text('List is empty'),
        );
      },
    );
  }
}
