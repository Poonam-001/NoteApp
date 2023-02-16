import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Title(
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.format_align_left)),
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'All Notes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 120,
          ),
          Container(
            width: 280,
            height: 280,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('asset/create_note.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Create Your First Note",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add a note about anything (your thoughts \n on climate change, or your history essay) \n and share it witht the world.",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              minWidth: double.infinity,
              height: 65,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: const Color.fromARGB(255, 227, 81, 81),
              child: const Text(
                'Create A Note',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
