import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_detector/home/cubit/gender_cubit.dart';
import 'package:gender_detector/home/views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Gender Detector',
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 179, 111, 157)),
            
        useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
