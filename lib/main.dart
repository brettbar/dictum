import 'package:flutter/material.dart';
import 'lists.dart';
import 'notes.dart';
import 'list_edit.dart';

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
            '/list_edit': (context) => const ListEditWidget(),
            //'/note_edit': (context) => const NoteEdit(),
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ListsGridView(),
    NotesGridView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  static List<String> _titles = <String>[
      "Lists",
      "Notes",
      "Share"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles.elementAt(_selectedIndex)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
