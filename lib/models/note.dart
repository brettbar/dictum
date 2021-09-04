import 'package:flutter/material.dart';

class Note {
  int id;
  String title;
  String text;
  Color color;
  DateTime dateCreated;
  DateTime dateLastEdited;


  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.color,
    required this.dateCreated,
    required this.dateLastEdited,
  });

  factory Note.fromMap(Map<String, dynamic> data) {
    return Note(
      id: data['id'],
      title: data['title'],
      text: data['text'],
      color: Color(data['color']),
      dateCreated: DateTime.fromMillisecondsSinceEpoch(data['date_created'] * 1000),
      dateLastEdited: DateTime.fromMillisecondsSinceEpoch(data['date_last_edited'] * 1000),
    );
  }

  Map<String, dynamic> toMap(bool forUpdate) {
    var data ={
      //'id': id,
      'title': title,
      'text': text,
      'color': color.value,
      'date_created': epochFromDate(dateCreated),
      'date_last_edited': epochFromDate(dateLastEdited),
    };

    if (forUpdate) {
      data["id"] = this.id;
    }

    return data;
  }

  int epochFromDate(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }

  @override
  String toString() {
    return '''
      Note {
        id: $id, 
        title: $title, 
        text: $text, 
        color: $color, 
        date_created: $dateCreated,
        date_last_edited: $dateLastEdited,
      }
    ''';
  }
}
