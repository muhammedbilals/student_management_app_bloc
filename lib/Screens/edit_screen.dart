import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditScreen extends StatelessWidget {
   EditScreen({super.key});
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _domaincontroller = TextEditingController();
  final _phonenumcontroller = TextEditingController();


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
              radius: 100,
            ),
            SizedBox(
              height: 10,
            ),
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
                // onAddStudentButtonClicked();
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
}
