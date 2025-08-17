import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText,required this.style,this.initialValue,required this.onSaved});
 final TextStyle style;
 final String hintText;
final String? initialValue;
final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required ';
        } else {
          return null;
        }

      },
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
