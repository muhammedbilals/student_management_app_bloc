import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String domain;
  @HiveField(4)
  final String Number;
  // @HiveField(5)
  // final String image;

  StudentModel(
      {required this.name,
      required this.age,
      this.id,
      required this.domain,
      required this.Number,
      // required this.image
      });
}
