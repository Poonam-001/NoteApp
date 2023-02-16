import 'package:flutter/material.dart';
import 'package:note_app/button.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print("Screen height is ${size.height}");
    print("Screen width is ${size.width}");
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("all notes"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'asset/create_note.png',
              height: size.height * 0.3,
              width: size.width * 0.6,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: size.height * 0.03),
            const Text("Create your first note"),
            const SizedBox(height: 15),
            const Text(
                "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world."),
            const Spacer(),
            Button(onPressed: () {}, buttonName: "Crate Note"),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
