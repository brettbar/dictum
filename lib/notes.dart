import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'database.dart';
import 'models/note.dart';

class NotesGridView extends StatefulWidget {
    @override
    _NotesGridViewState createState() => new _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> {
    List<Map<String, dynamic>> _allNotesInQueryResult = [];

    List<Widget> _notes = <Widget>[
        NoteTile(Colors.blue, Icons.bluetooth),
        NoteTile(Colors.red, Icons.dangerous),
        NoteTile(Colors.orange, Icons.warning),
        NoteTile(Colors.green, Icons.check),
    ]; 

    final List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
    ];

    @override 
    void initState() {
        super.initState();         
        DatabaseProvider.dbProvider.notes();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: StaggeredGridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                staggeredTiles: _staggeredTiles,
                children: _notes,
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () { Navigator.pushNamed(context, '/list_edit'); },
                tooltip: 'Create New List',
                child: const Icon(Icons.add),
                backgroundColor: Colors.amber[600],
            )
        );
    }

    Future<List<Note>> getNotesFromDB() async {
        var result = await DatabaseProvider.dbProvider.notes();
        setState(() {
            _allNotesInQueryResult = result;
        });
    }
}

class NoteTile extends StatelessWidget {
    const NoteTile(this.backgroundColor, this.iconData);

    final Color backgroundColor;
    final IconData iconData;

    @override
    Widget build(BuildContext context) {
        return Card(
            color: backgroundColor,
            child: InkWell(
                onTap: () {},
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                            iconData,
                            color: Colors.white,
                        ),
                    ),
                ),),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(20),
            )
        );
    }
}
