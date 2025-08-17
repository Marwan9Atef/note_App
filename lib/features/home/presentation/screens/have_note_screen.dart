import 'package:flutter/cupertino.dart';
import 'package:note_app/features/home/data/models/note_model.dart';
import 'package:note_app/features/home/presentation/screens/note_screen.dart';
import 'package:note_app/features/home/presentation/widget/note_item.dart';

class HaveNoteScreen extends StatelessWidget {
   const HaveNoteScreen({super.key});


   @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context, index) => GestureDetector(onTap: () =>Navigator.pushNamed(context, NoteScreen.routeName)
          ,child: NoteItem( notes: NoteModel(title: "ddg", description: "dfgd", date: "dg", boxColor: 1))),
      itemCount: 1,
      separatorBuilder:(context, index) => const SizedBox(height:15,),



    );
  }
}
