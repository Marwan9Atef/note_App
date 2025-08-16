import 'package:flutter/material.dart';
class NoNoteScreen extends StatelessWidget {
  const NoNoteScreen({super.key});
  final double heightOfPhoto = 0.3191964285714286;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset("assets/images/noNote.png", width: double.infinity, height: MediaQuery.sizeOf(context).height*heightOfPhoto),
       const SizedBox(height:10,),
        Text("Create your first note !",style: TextTheme.of(context).bodySmall,)
      ]
    );
  }
}
