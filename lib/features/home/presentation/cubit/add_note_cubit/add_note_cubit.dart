import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/features/home/data/models/note_model.dart';
import '../../../../../core/constant.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
 Future<void> addNote(NoteModel note) async {
   emit(AddNoteLoading());
   try{
  var hiveBox = await Hive.openBox<NoteModel>(Constant.noteBoxName);
  await hiveBox.add(note);
  emit(AddNoteSuccess());
   }catch(eMessage){
      emit(AddNoteFailure(eMessage.toString()));
   }
  }

}
