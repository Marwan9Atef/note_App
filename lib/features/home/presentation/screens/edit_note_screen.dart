import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/theme/app_theme.dart';
import 'package:note_app/core/utils/ui_utils.dart';
import 'package:note_app/features/home/data/models/note_model.dart';
import 'package:note_app/features/home/presentation/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/home/presentation/cubit/add_note_cubit/add_note_state.dart';
import 'package:note_app/features/home/presentation/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/features/home/presentation/widget/action_icon.dart';
import 'package:note_app/features/home/presentation/widget/custom_text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  static const String routeName = '/edit_note';


  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {

  final _formKey = GlobalKey<FormState>();
  String? title, description;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return  BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            UIUtils.showLoading(context);
          } else if (state is AddNoteSuccess) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage('Edit Note successful');
            Navigator.pop(context);
            context.read<NoteCubit>().fetchNotes();
          } else if (state is AddNoteFailure) {
            UIUtils.hideLoading(context);
            UIUtils.showMessage(state.errorMessage);
          }
        },
        builder: (context, state) {
          TextTheme textTheme = Theme.of(context).textTheme;

          return Scaffold(
            appBar: AppBar(
              foregroundColor: AppTheme.white,
              actions: [
                ActionIcon(
                  isSearch: false,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      context.read<AddNoteCubit>().addNote(
                        NoteModel(
                          title: title!,
                          description: description!,
                          date:DateFormat("dd-MM-yyyy").format(DateTime.now()).toString(),
                          boxColor: args.boxColor,
                        ),
                      );
                      if(title !=null||description!=null) {
                        args.delete();
                      }
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
            body: Form(
              autovalidateMode: autoValidateMode,
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Title",
                      style: textTheme.displayLarge!,
                      onSaved: (value) => title = value,
                      initialValue: args.title,

                    ),
                    CustomTextField(
                      hintText: "Description",
                      style: textTheme.bodyMedium!,
                      onSaved: (value) => description = value,
                      initialValue: args.description,


                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }

}
