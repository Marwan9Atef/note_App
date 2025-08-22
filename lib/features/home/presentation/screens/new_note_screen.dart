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

class NewNoteScreen extends StatefulWidget {
   const NewNoteScreen({super.key});

  static const String routeName = '/note';


  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  @override
  void initState() {
    color.shuffle();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String? title, description;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
final List<Color>color=[
  AppTheme.purple,
  AppTheme.pink,
  AppTheme.lightBlue,
  AppTheme.green,
  AppTheme.yellow,
  AppTheme.orange,
  ];
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteLoading) {
            UIUtils.showLoading(context);
          } else if (state is AddNoteSuccess) {
            UIUtils.hideLoading(context);

            UIUtils.showMessage('Add Note successful');
            context.read<NoteCubit>().fetchNotes();
            Navigator.pop(context);
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
                          boxColor: color[0].value,
                        ),
                      );

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

                    ),
                    CustomTextField(
                      hintText: "Description",
                      style: textTheme.bodyMedium!,
                      onSaved: (value) => description = value,


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
