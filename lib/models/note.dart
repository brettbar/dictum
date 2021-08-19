import 'package:flutter/material.dart';

class Note {
    final int id;
    final String title;
    final String text;
    final Color color;
    final DateTime creationTime;


    Note({
        required this.id,
        required this.title,
        required this.text,
        required this.color,
        required this.creationTime,
    });

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'title': title,
            'text': text,
            'color': color.toString(),
            'creation_time': creationTime.toUtc(),
        };
    }

    @override
    String toString() {
        return '''
Note{
    id: $id, 
    title: $title, 
    text: text, 
    color: color.toString(), 
    creation_time: creationTime.toUtc()
}
''';
    }
}
