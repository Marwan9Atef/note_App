import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:note_app/core/constant.dart';
import 'package:note_app/features/home/presentation/cubit/toggle_screen_cubit.dart';
import 'package:note_app/features/home/presentation/screens/note_screen.dart';
import 'package:path_provider/path_provider.dart' show  getTemporaryDirectory;
import 'core/theme/app_theme.dart';
import 'features/home/presentation/screens/home_screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );


await Hive.initFlutter();
await Hive.openBox(Constant.noteBoxName);

  runApp(NoteApp());
}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
//test
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleScreenCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          NoteScreen.routeName: (_) => NoteScreen(),
        },
        initialRoute: HomeScreen.routeName,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
