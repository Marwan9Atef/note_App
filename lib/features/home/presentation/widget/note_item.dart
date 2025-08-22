import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/core/utils/ui_utils.dart';
import 'package:note_app/features/home/data/models/note_model.dart';
import 'package:note_app/features/home/presentation/cubit/note_cubit/note_cubit.dart';

class NoteItem extends StatelessWidget {
   const NoteItem({super.key,required this.notes});
   final NoteModel notes;


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion() ,

        children: [
          SlidableAction(
            onPressed: (_)  {
             notes.delete();
             UIUtils.showMessage("Note deleted successfully");
             context.read<NoteCubit>().fetchNotes();

            },
            backgroundColor: AppTheme.red,
            foregroundColor: AppTheme.white,
            icon: Icons.delete_rounded,
            borderRadius: BorderRadius.circular(10),
            label: 'Delete',
          ),

        ],
      ),
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        decoration: BoxDecoration(
          color:Color(notes.boxColor),
          borderRadius: BorderRadius.circular(10),


        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notes.title,style: textTheme.displayLarge!.copyWith(color:AppTheme.primary ),),
           const SizedBox(
              height: 10,

            ),
            Text(notes.description,style: textTheme.bodyLarge!.copyWith(color: AppTheme.lightDark),),
            const SizedBox(
              height: 20,

            ),
            Row(
              children: [
                Spacer(),
                Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),style:textTheme.bodyLarge!.copyWith(color: AppTheme.lightDark) ,)

              ],

            )
          ],
        ),



      ),
    );
  }
}
