import 'package:flutter/material.dart';
import 'models/note.dart';
import 'database.dart';
import 'models/utils.dart';

class NoteTile extends StatefulWidget {
  final Note note;
  const NoteTile(this.note);

  @override
  _NoteTileState createState() => _NoteTileState();
  
}

class _NoteTileState extends State<NoteTile> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: InkWell(
        onTap: () async {
          await DatabaseProvider.dbProvider.deleteNote( widget.note.id );
          StateManager.updateNeeded = true;
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
              child: Text(
                widget.note.id.toString(),
              ),
            ),
          ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(20),
      )
    );
  }
}
