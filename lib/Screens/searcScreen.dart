import 'dart:io';
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
                 
                
                
      body: Column(
        children: [
          Expanded(
            child: (displayStudent.length != 0)
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      // File imageFile = File(displayStudent[index].image);
                      return ListTile(
                        // leading: CircleAvatar(
                        //   backgroundColor: Colors.white,
                        //   // backgroundImage: FileImage(File(data.image)),
                        //   radius: 20,
                        // ),
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
    );
  }
}