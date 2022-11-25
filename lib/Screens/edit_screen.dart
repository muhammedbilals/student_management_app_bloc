import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/db/functions/db_functions.dart';
import 'package:student_database/db/model/data_model.dart';

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
            IconButton(
                onPressed: () {
                  getImage();
                },
                icon: Icon(Icons.camera)),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'age',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _domainController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Domain',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Phone Number',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Edit(widget.index);
                Navigator.pop(context);
              },
              icon: Icon(Icons.add),
              label: Text('Edit Student'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> Edit(int index) async {
    // final _name = _namecontroller!.text.trim();
    // final _age = _ageController!.text.trim();
    // final _place = _placeController!.text.trim();
    // final _phone = _phoneController!.text.trim();

    // final _key = DateTime.now().toString();
    // final image = path!;
    final _student = StudentModel(
        name: _nameController!.text,
        age: _ageController!.text,
        domain: _domainController!.text,
        Number: _phoneController!.text,
        // id: _key,
        image: path!);
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.putAt(index, _student);
    getAllStudents();
  }

  getImage() async {
    var path;
    final PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedFile == null) {
      return;
    } else {
      setState(() {
        this.path = PickedFile.path;
      });
    }
  }
}
