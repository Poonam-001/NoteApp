import 'package:flutter/material.dart';
import 'package:note_app/button.dart';
import 'package:note_app/note_model.dart';
import 'package:note_app/provider.dart';
import 'package:note_app/title_description.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Title(
              color: Colors.black,
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Add Note',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                  ),
                ],
              )),
          const SizedBox(height: 10),
          TitleDescription(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
          const SizedBox(
            height: 480,
          ),
          Button(
            onPressed: () {
              NoteModel note = NoteModel(
                title: titleController.text,
                description: descriptionController.text,
                id: DateTime.now().microsecond,
              );
              Provider.of<NoteProvider>(context, listen: false).addNote(note);
              Navigator.pop(
                context,
              );
            },
            buttonName: 'Add Note',
          )
        ]),
      ),
    );
  }
}
