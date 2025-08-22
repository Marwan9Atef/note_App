import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/data/models/note_model.dart';
import 'package:note_app/features/home/presentation/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/features/home/presentation/screens/edit_note_screen.dart';
import 'package:note_app/features/home/presentation/widget/note_item.dart';

class HaveNoteScreen extends StatefulWidget {
   const HaveNoteScreen({super.key});

  @override
  State<HaveNoteScreen> createState() => _HaveNoteScreenState();
}

class _HaveNoteScreenState extends State<HaveNoteScreen> {
  @override
  void initState() {
   context.read<NoteCubit>().fetchNotes();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    List<NoteModel>notes = context.watch<NoteCubit>().notes ?? [];
    return ListView.separated(
      itemBuilder:(context, index) => GestureDetector(onTap: () {
        Navigator.pushNamed(context, EditNoteScreen.routeName,arguments: notes[index]);
      }
          ,child: NoteItem(notes: notes[index],)),
      itemCount: notes.length,
      separatorBuilder:(context, index) => const SizedBox(height:15,),



    );
  }
}
