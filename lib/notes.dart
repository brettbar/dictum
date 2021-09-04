import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'database.dart';
import 'models/note.dart';
import 'note_tile.dart';
import 'models/utils.dart';

class NotesGridView extends StatefulWidget {
  @override
  _NotesGridViewState createState() => new _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> {
  List<Map<String, dynamic>> _allNotesInQueryResult = [];

  @override 
  void initState() {
    super.initState();         
    DatabaseProvider.dbProvider.notes();
  }

  @override
  Widget build(BuildContext context) {
    if (StateManager.updateNeeded) getNotesFromDB();

    return Scaffold(
      body: StaggeredGridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        children: List.generate(
          this._allNotesInQueryResult.length, (i) { return _tileGenerator(i); }
        ),
        staggeredTiles: List.generate(
          this._allNotesInQueryResult.length, (i) { return StaggeredTile.count( 1, 1.25 ); }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, '/note_edit'); },
        tooltip: 'Create New List',
        child: const Icon(Icons.add),
        backgroundColor: Colors.amber[600],
      )
    );
  }

  Future<void> getNotesFromDB() async {
    var result = await DatabaseProvider.dbProvider.notes();
    setState(() {
      this._allNotesInQueryResult = result;
      StateManager.updateNeeded = false;
    });
  }

  NoteTile _tileGenerator(int i) {
    return NoteTile( Note.fromMap(_allNotesInQueryResult[i]) );
  }
}

