import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/add_note.dart';
import 'package:note_app/edit_note.dart';
import 'package:note_app/note_model.dart';
import 'package:note_app/provider.dart';
import 'package:provider/provider.dart';

class RecentNote extends StatefulWidget {
  const RecentNote({super.key});

  @override
  State<RecentNote> createState() => _RecentNoteState();
}

class _RecentNoteState extends State<RecentNote> {
  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider = Provider.of<NoteProvider>(context);
    if (noteProvider.notes.isEmpty) {
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
                  children: const <Widget>[
                    Icon(Icons.format_align_left),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'All Notes',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddNote(),
                    ),
                  );
                },
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 238, 226),
        title: const Text(
          'Recent Notes',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.format_align_left,
                color: Colors.black,
              ));
        }),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: Consumer<NoteProvider>(
        builder: (context, value, child) {
          final List<NoteModel> notes = value.notes;
          return MasonryGridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              debugPrint("Current index is $index");
              NoteModel note = notes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNote(note: note),
                  ));
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            note.title,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: Text(
                            note.description,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        IconButton(
                          alignment: Alignment.bottomRight,
                          color: const Color.fromARGB(255, 220, 196, 243),
                          onPressed: () {
                            value.deleteNote(note);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 220, 196, 243),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddNote()));
            },
            child: const Icon(
              Icons.add,
            ),
          );
        },
      ),
    );
  }
}
