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
  int _selectedIndexForBottomNavigationBar = 0;

  static List<Widget> _pages = <Widget>[
    NotesGridView(),
    Icon(Icons.directions_walk),
    Icon(Icons.directions_bike),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndexForBottomNavigationBar)
      ),
 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTappedForBottomNavigationBar,
        selectedItemColor: Colors.orangeAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Habits'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          ),
        ],
        currentIndex: _selectedIndexForBottomNavigationBar,
      )
    );
  }

  void _onItemTappedForBottomNavigationBar(int index) {
    setState(() {
      _selectedIndexForBottomNavigationBar = index;
    });
  }
}
