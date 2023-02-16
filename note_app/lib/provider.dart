import 'package:flutter/foundation.dart';
import 'package:note_app/note_model.dart';

class NoteProvider with ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(NoteModel note) {
    final index = _notes.indexWhere((element) => element.id == note.id);
    _notes[index] = note;
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    _notes.removeWhere((element) => element.id == note.id);
    notifyListeners();
  }
}
