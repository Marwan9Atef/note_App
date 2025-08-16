import 'package:flutter/cupertino.dart';
import 'package:note_app/core/argument.dart';

import 'package:note_app/features/home/data/models/note_model.dart';
import 'package:note_app/features/home/presentation/screens/note_screen.dart';
import 'package:note_app/features/home/presentation/widget/note_item.dart';

class HaveNoteScreen extends StatelessWidget {
   const HaveNoteScreen({super.key});


   @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context, index) => GestureDetector(onTap: () =>Navigator.pushNamed(context, NoteScreen.routeName,arguments: Argument(title: NoteModel.notes[index].title, description:NoteModel.notes[index].description,index: index))
          ,child: NoteItem( notes: NoteModel.notes[index],)),
      itemCount: NoteModel.notes.length,
      separatorBuilder:(context, index) => const SizedBox(height:15,),



    );
  }
}
