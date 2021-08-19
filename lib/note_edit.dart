import 'package:flutter/material.dart';
import './database.dart';
import './models/note.dart';

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
                await DatabaseProvider.dbProvider.insertNote(
                    Note(
                        id: 0,
                        title: 'New Note',
                        text: '',
                        color: Colors.green,
                        creationTime: DateTime.now(),
                    )
                );
                Navigator.pop(context);
            },
            tooltip: 'Increment Counter',
            child: const Icon(Icons.add),
        ),
    );
  }
}
