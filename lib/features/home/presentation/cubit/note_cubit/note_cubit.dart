import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../../core/constant.dart';
import '../../../data/models/note_model.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>?notes;
  Future<void>fetchNotes()async{
    var hiveBox = await Hive.openBox<NoteModel>(Constant.noteBoxName);
  notes =hiveBox.values.toList();
  emit(NoteLoaded());

  }
}
