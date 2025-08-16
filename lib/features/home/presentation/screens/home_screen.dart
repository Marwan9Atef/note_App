import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/cubit/toggle_screen_cubit.dart';
import 'package:note_app/features/home/presentation/screens/have_note_screen.dart';
import 'package:note_app/features/home/presentation/screens/no_note_screen.dart';
import 'package:note_app/features/home/presentation/widget/search_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Notes'),
        actions:[
          SearchIcon(onTap: onSearchTaped,)


        ] ,

      ),
       body: 
      Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 30),
            child: BlocBuilder<ToggleScreenCubit, bool>(
      builder: (context, state) {
        if(state == true){
        return HaveNoteScreen();
      }
        else{
          return const NoNoteScreen();
        }
      },
      ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ToggleScreenCubit>().toggleScreen();
        },
        child: const Icon(Icons.add),
      ),



    );
  }
  void onSearchTaped(){}

}
