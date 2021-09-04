import 'package:flutter/material.dart';
import './database.dart';
import './models/note.dart';
import './models/utils.dart';

class NoteEditWidget extends StatefulWidget {
  const NoteEditWidget({Key? key}) : super(key: key);

  @override
  State<NoteEditWidget> createState() => _NoteEditWidgetState();
}

class _NoteEditWidgetState extends State<NoteEditWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async { 
          _saveNote();
          Navigator.pop(context);
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _saveNote() async {
      Note newNote = Note(
        id: -1,
        title: 'New Note',
        text: 'this is a new note',
        color: Colors.green,
        dateCreated: DateTime.now(),
        dateLastEdited: DateTime.now(),
      );

      if (newNote.id == -1) {
        int autoIncrementedId =
            await DatabaseProvider.dbProvider.insertNote(newNote);
          newNote.id = autoIncrementedId;
      } else {
        await DatabaseProvider.dbProvider.updateNote(newNote);
      }
      StateManager.updateNeeded = true;
  }
}
