import 'package:flutter/material.dart';
import 'package:student_database/db/functions/db_functions.dart';
import 'package:student_database/db/model/data_model.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({super.key});

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _domaincontroller = TextEditingController();
  final _phonenumcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _agecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'age',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _domaincontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Domain',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _phonenumcontroller,
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
                onAddStudentButtonClicked();
                Navigator.pop(context);
              },
              icon: Icon(Icons.add),
              label: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();
    final _domain = _domaincontroller.text.trim();
    final _number = _phonenumcontroller.text.trim();
    
    

    if (_name.isEmpty || _age.isEmpty || _domain.isEmpty || _number.isEmpty) {
      return;
    } else {
      print('$_name $_age');
    }

    final _student = StudentModel(name: _name, age: _age, domain: _domain, Number: _number );
    addStudent(_student);
  }
}
