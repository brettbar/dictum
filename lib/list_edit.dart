import 'package:flutter/material.dart';


class ListEditWidget extends StatefulWidget {
  const ListEditWidget({Key? key}) : super(key: key);

  @override
  State<ListEditWidget> createState() => _ListEditWidgetState();
}

class _ListEditWidgetState extends State<ListEditWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pop(context); },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
