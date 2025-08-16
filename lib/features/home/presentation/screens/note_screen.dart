import 'package:flutter/material.dart';
import 'package:note_app/core/argument.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/features/home/presentation/widget/custom_text_field.dart';

class NoteScreen extends StatefulWidget {
   const NoteScreen({super.key});
  static const String routeName = '/note';

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
 final TextEditingController _titleController=TextEditingController();

final TextEditingController _descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {


     final args = ModalRoute.of(context)!.settings.arguments as Argument;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppTheme.white,

      ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25,top: 30 ),
          child: Column(
            children: [
              CustomTextField(hintText: "Title", style: textTheme.displayLarge!,initialValue: args.title,controller: _titleController,),
              const SizedBox(height: 40,),
              CustomTextField(hintText: "Description", style: textTheme.bodyMedium!,initialValue: args.description,controller: _descriptionController,),



            ],

          ),
        ),


    );
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
