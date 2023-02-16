import 'package:flutter/material.dart';
import 'package:note_app/button.dart';
import 'package:note_app/heading.dart';
import 'package:note_app/note_model.dart';
import 'package:note_app/provider.dart';
import 'package:note_app/title_description.dart';
import 'package:provider/provider.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    descriptionController =
        TextEditingController(text: widget.note.description);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const TitleText(
            title: 'Edit Note',
          ),
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
                id: widget.note.id,
              );
              Provider.of<NoteProvider>(context, listen: false)
                  .updateNote(note);
              Navigator.pop(
                context,
              );
            },
            buttonName: 'Edit Note',
          ),
        ]),
      ),
    );
  }
}
