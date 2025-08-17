import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
 @HiveField(0)
 final String title;
  @HiveField(1)
 final String description;
  @HiveField(2)
 final String date;
  @HiveField(3)
final int boxColor ;



  NoteModel({required this.title,required this.description,required this.date,required this.boxColor});
 // static List<NoteModel> notes = [
 //     NoteModel(title: "Note 1", description: "This is the first note", date: DateTime.now(),boxColor: AppTheme.yellow),
 //     NoteModel(title: "Note 2", description: "This is the second note", date: DateTime.now(),boxColor: AppTheme.purple ),
 //     NoteModel(title: "Note 3", description: "This is the third note", date: DateTime.now(),boxColor: AppTheme.pink ),
 //   NoteModel(title: "Note 4", description: "This is the f note", date: DateTime.now(),boxColor: AppTheme.lightBlue ),
 //  ];



}