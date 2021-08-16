import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListsGridView extends StatefulWidget {
    @override
    _ListsGridViewState createState() => new _ListsGridViewState();
}


class _ListsGridViewState extends State<ListsGridView> {
    final List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
        StaggeredTile.count(1, 1.25),
    ];

    List<Widget> _lists = <Widget>[
        ListTile(Colors.blue, Icons.bluetooth),
        ListTile(Colors.red, Icons.dangerous),
        ListTile(Colors.orange, Icons.warning),
        ListTile(Colors.green, Icons.check),
    ]; 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: StaggeredGridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20),
                staggeredTiles: _staggeredTiles,
                children: _lists,
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () { Navigator.pushNamed(context, '/list_edit'); },
                tooltip: 'Create New List',
                child: const Icon(Icons.add),
                backgroundColor: Colors.amber[600],
            )
        );
    }
}

class ListTile extends StatelessWidget {
    const ListTile(this.backgroundColor, this.iconData);

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
