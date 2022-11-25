// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:student_database/db/functions/db_functions.dart';
// import 'package:student_database/db/model/data_model.dart';

// class ScreenSearch extends StatelessWidget {
//   TextEditingController? _textEditingController = TextEditingController();

 



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
      //   title: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.blue.shade100,
      //       borderRadius: BorderRadius.circular(30),
      //     ),
      //     child: TextField(
      //       onChanged: (value) {},
      //       controller: _textEditingController,
      //       decoration: InputDecoration(
      //           border: InputBorder.none,
      //           errorBorder: InputBorder.none,
      //           focusedBorder: InputBorder.none,
      //           contentPadding: EdgeInsets.all(15),
      //           hintText: 'search'),
      //     ),
      //   ),
      // ),
//       body: ValueListenableBuilder(
//         valueListenable: StudentListNotifier,
//         builder:
//             (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
//           return ListView.separated(
//             itemBuilder: (ctx, index) {
//               final data = studentList[index];
//               return ListTile(
//                 onTap: () {
//                   studentList = studentList;
//                 },
//                 title: Text(data.name),
//                 subtitle: Text(data.age),
//               );
//             },
//             separatorBuilder: (ctx, index) {
//               return const Divider();
//             },
//             itemCount: studentList.length,
//           );
//         },
//       ),
//     );
//   }
// }
// import 'dart:io';
// // import 'dart:js_util';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:student/db/model/data_model.dart';
// import 'package:student_database/db/model/data_model.dart';
// // import 'package:main_project_hive/models/student_model.dart';
// // import 'package:main_project_hive/widgets/text_input_field.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_database/db/model/data_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  final List<StudentModel> studentBoxList =
      Hive.box<StudentModel>('student_db').values.toList();

  late List<StudentModel> displayStudent = List<StudentModel>.from(studentBoxList);

  void searchStudentList(String value) {
    setState(() {
      displayStudent = studentBoxList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
                  searchStudentList(value);
                },
            
            decoration: InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'search'),
                controller: _searchController,
          ),
        ),
      ),
                 
                
                
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 7),
              
            ),
            Expanded(
              child: (displayStudent.length != 0)
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        // File imageFile = File(displayStudent[index].image);
                        return ListTile(
                          leading: CircleAvatar(
                            // backgroundImage: FileImage(imageFile),
                            radius: 20,
                          ),
                          title: Text(displayStudent[index].name),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: displayStudent.length,
                    )
                    
                  : const Center(child: Text("The data is not Found")),
            ),
          ],
        ),
      ),
    );
  }
}