import 'package:flutter/material.dart';
import 'package:note_app/provider.dart';
import 'package:provider/provider.dart';

import 'practice_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteProvider>(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffF8EEE2),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            centerTitle: true,
          ),
        ),
        home: const PracticeScreen(),
      ),
    );
  }
}
