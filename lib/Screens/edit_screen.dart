import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_database_bloc/bloc/student_bloc.dart';
import 'package:student_database_bloc/db/functions/db_functions.dart';
import 'package:student_database_bloc/db/model/data_model.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, required this.index, required this.data});

  int index;
  StudentModel data;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? path;
  TextEditingController? _nameController;
  TextEditingController? _ageController;
  TextEditingController? _domainController;
  TextEditingController? _phoneController;
  ValueNotifier _stringnofitier = ValueNotifier('');

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.data.name);

    _ageController = TextEditingController(text: widget.data.age);

    _domainController = TextEditingController(text: widget.data.domain);

    _phoneController = TextEditingController(text: widget.data.Number);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // details image avathar-----------------------------------------------
              CircleAvatar(
                backgroundImage: FileImage(File(widget.data.image)),
                radius: 100,
              ),
              SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: _stringnofitier,
                builder: (context, value, child) {
                  return IconButton(
                      onPressed: () async {
                        var path;
                        final PickedFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (PickedFile == null) {
                          return;
                        } else {
                          value = PickedFile.path;
                        }
                      },
                      icon: Icon(Icons.camera));
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.abc),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _nameController!.clear();
                      },
                      icon: Icon(Icons.close)),
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.onetwothree),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _ageController!.clear();
                      },
                      icon: Icon(Icons.close)),
                  border: OutlineInputBorder(),
                  labelText: 'age',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _domainController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.computer),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _domainController!.clear();
                      },
                      icon: Icon(Icons.close)),
                  border: OutlineInputBorder(),
                  labelText: 'Domain',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _phoneController!.clear();
                      },
                      icon: Icon(Icons.close)),
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final _student = StudentModel(
                      name: _nameController!.text,
                      age: _ageController!.text,
                      domain: _domainController!.text,
                      Number: _phoneController!.text,
                      // id: _key,
                      image: path!);
                  context
                      .read<StudentBloc>()
                      .add(UpdateSpecificData(_student, widget.index));
                  Navigator.pop(context);
                },
                icon: Icon(Icons.add),
                label: Text('Edit Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> Edit(int index) async {
  //   final _student = StudentModel(
  //       name: _nameController!.text,
  //       age: _ageController!.text,
  //       domain: _domainController!.text,
  //       Number: _phoneController!.text,
  //       // id: _key,
  //       image: path!);
  //   final studentDB = await Hive.openBox<StudentModel>('student_db');
  //   studentDB.putAt(index, _student);
  //   getAllStudents();
  // }

  // getImage() async {
  //   var path;
  //   final PickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (PickedFile == null) {
  //     return;
  //   } else {
  //     setState(() {
  //       this.path = PickedFile.path;
  //     });
  //   }
  // }
}
