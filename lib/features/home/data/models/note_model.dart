

import 'dart:ui';

import 'package:note_app/core/theme/app_theme.dart';

class NoteModel {
 final String title;
 final String description;
 final DateTime date;
final Color boxColor ;



const  NoteModel({required this.title,required this.description,required this.date,required this.boxColor});
 static List<NoteModel> notes = [
     NoteModel(title: "Note 1", description: "This is the first note", date: DateTime.now(),boxColor: AppTheme.yellow),
     NoteModel(title: "Note 2", description: "This is the second note", date: DateTime.now(),boxColor: AppTheme.purple ),
     NoteModel(title: "Note 3", description: "This is the third note", date: DateTime.now(),boxColor: AppTheme.pink ),
  ];



}