import 'package:flutter/material.dart';
import 'package:student_database_bloc/Screens/home/widgets/add_student_widget.dart';

import 'package:student_database_bloc/Screens/home/widgets/list_student_widget.dart';
import 'package:student_database_bloc/Screens/searcScreen.dart';

import 'package:student_database_bloc/db/functions/db_functions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Student Details'),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: ListStudentWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStudentWidget(),
                    ),
                  );
                  // Navigator.pop(context);
                },
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
