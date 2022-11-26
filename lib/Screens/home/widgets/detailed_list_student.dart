import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:student_database/db/model/data_model.dart';

class Details extends StatefulWidget {
  var data;

  Details({super.key, this.data});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  StudentModel? studentdata;
  // String? image;
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);
    this.image = imageTemporary;

    // image = imagetemporary;
  }

  @override
  Widget build(BuildContext context) {
    // StudentDetails(studentdata);
    print(studentdata);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student Details'),
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Container(
                  //   child: Text('Name: ${widget.data.name}'),
                  //   decoration: BoxDecoration(
                      
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: Colors.white10
                  // ),
                  // ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CircleAvatar(
                    backgroundImage: FileImage(File(widget.data.image)),
                        radius: 100,
                      ),
                 ),
                  ListTile(
                    leading: Text(
                        style: TextStyle(
                          
                          fontSize: 23,
                        ),
                        "Name : ${widget.data.name}"),
                    // title: Text('${passValue.name}'),
                  ),
                  ListTile(
                    leading: Text(
                        style: TextStyle(fontSize: 23),
                        "Age : ${widget.data.age}"),
                  ),
                  ListTile(
                    leading: Text(
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        "Domain : ${widget.data.domain}"),
                  ),
                  ListTile(
                    leading: Text(
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        "Phone Number : ${widget.data.Number}"),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
// Future<StudentModel?> StudentDetails(index) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final studentdata = studentDB.getAt(index);
//   return studentdata;
// }

}
//  Text('Name:${widget.data.name}'),
//                     Text('Age:${widget.data.age}'),
//                     Text('Domain:${widget.data.domain}'),
//                     Text('Number:${widget.data.Number}'),