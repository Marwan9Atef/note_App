import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText,required this.style,this.initialValue,required this.controller});
 final TextStyle style;
 final String hintText;
final String? initialValue;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style:style ,
      cursorColor: AppTheme.white,

       initialValue: initialValue,
      decoration: InputDecoration(

        border: InputBorder.none,
        hint: Text(hintText),
        hintStyle: style


      ),



    );
  }
}
