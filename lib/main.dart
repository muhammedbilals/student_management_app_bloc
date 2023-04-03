import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_database_bloc/Screens/Home.dart';
import 'package:student_database_bloc/bloc/student_bloc.dart';
import 'package:student_database_bloc/db/model/data_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>('student_db');
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
  //   Hive.registerAdapter(StudentModelAdapter());
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(),
      child: MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
