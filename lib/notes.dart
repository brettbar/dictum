import 'package:flutter/material.dart';

class NotesGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text("And I know the pieces fit cause I watched them fall away"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.teal[100],
                ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text("And I know the pieces fit cause I watched them fall away"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.teal[100],
                ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text("And I know the pieces fit cause I watched them fall away"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.teal[100],
                ),
            ),
        ],
    );
  }
}

