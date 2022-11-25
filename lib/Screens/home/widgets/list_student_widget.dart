import 'package:flutter/material.dart';
import 'package:student_database/Screens/edit_screen.dart';
import 'package:student_database/Screens/home/widgets/detailed_list_student.dart';
import 'package:student_database/db/functions/db_functions.dart';
import 'package:student_database/db/model/data_model.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              // leading image circle----------------------------------------
              leading: CircleAvatar(
                radius: 20,
              ),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(data: data),
                  ),
                );
              },
              title: Text(data.name),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                     
                      MaterialPageRoute(
                        builder: (context) => EditScreen(),
                      ),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      if (data != null) {
                        deleteStudent(index);
                      } else {
                        print('student id is null');
                      }
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
          itemCount: studentList.length,
        );
      },
    );
  }
}
