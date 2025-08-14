

import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main(){
  runApp(NoteApp());


}
class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
       HomeScreen.routeName: (_) =>  HomeScreen(),
      },
initialRoute: HomeScreen.routeName,
      darkTheme: AppTheme.darkTheme,
      themeMode:ThemeMode.dark ,
    );
  }
}
