import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:note_app/core/constant.dart';
class ToggleScreenCubit extends HydratedCubit<bool> {
  ToggleScreenCubit() : super(true);

  @override
  bool? fromJson(Map<String, dynamic> json)=>json[Constant.noNoteKey] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) =>{Constant.noNoteKey:true};
  void toggleScreen() {
    emit(!state);
  }


}
