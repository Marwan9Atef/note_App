import 'package:flutter/material.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/features/home/presentation/widget/action_icon.dart';
import 'package:note_app/features/home/presentation/widget/custom_text_field.dart';

class NoteScreen extends StatefulWidget {
   const NoteScreen({super.key});
  static const String routeName = '/note';

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  final _formKey = GlobalKey<FormState>();
  String? title, description;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppTheme.white,
        actions: [
          ActionIcon(onTap: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pop(context, {'title': title, 'description': description});
            } else {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });
            }
          }
          , isSearch: false,)
        ],

      ),
      body: Form(
        autovalidateMode: autovalidateMode,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Column(
            children: [
              CustomTextField(hintText: "Title",
                style: textTheme.displayLarge!,
                initialValue: null,
                onSaved: (value) {
                  title = value;
                },),
              CustomTextField(hintText: "Description",
                style: textTheme.bodyMedium!,
                initialValue: null,
                onSaved: (value) {
                  description = value;
                },),


            ],

          ),
        ),
      ),


    );
  }

}
