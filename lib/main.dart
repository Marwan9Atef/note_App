import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/features/home/presentation/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/features/home/presentation/cubit/toggle_screen_cubit/toggle_screen_cubit.dart';
import 'package:note_app/features/home/presentation/screens/edit_note_screen.dart';
import 'package:note_app/features/home/presentation/screens/new_note_screen.dart';
import 'package:path_provider/path_provider.dart' show  getTemporaryDirectory;
import 'core/my_bloc_observer.dart';
import 'core/theme/app_theme.dart';
import 'features/home/data/models/note_model.dart';
import 'features/home/presentation/screens/home_screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );


await Hive.initFlutter();
Hive.registerAdapter(NoteModelAdapter());
await Hive.openBox<NoteModel>(Constant.noteBoxName);
Bloc.observer = MyBlocObserver();
  runApp(NoteApp());

}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ToggleScreenCubit()),
        BlocProvider(create: (context) => NoteCubit()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          NewNoteScreen.routeName: (_) => NewNoteScreen(),
          EditNoteScreen.routeName: (_) => EditNoteScreen(),
        },
        initialRoute: HomeScreen.routeName,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
