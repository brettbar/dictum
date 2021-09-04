import 'package:flutter/material.dart';
import 'notes.dart';
import 'note_edit.dart';

void main() => runApp(const DictumApp());

class DictumApp extends StatelessWidget {
  const DictumApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        //home: HomeWidget(), 
        initialRoute: '/',
        routes: {
            '/': (context) => const HomeWidget(),
            '/note_edit': (context) => const NoteEditWidget(),
        },
        theme: ThemeData(
            brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark, 
        debugShowCheckedModeBanner: false,
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Center(
        child: NotesGridView(),
      ),
    );
  }
}
