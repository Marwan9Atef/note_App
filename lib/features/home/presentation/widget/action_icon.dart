import 'package:flutter/cupertino.dart';
import 'package:note_app/core/theme/app_theme.dart';


class ActionIcon extends StatelessWidget {
  const ActionIcon({super.key,required this.onTap,this.isSearch=true});
final VoidCallback onTap;
final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding:const EdgeInsets.all(13),
        margin:const EdgeInsets.only(right: 21),
        decoration: BoxDecoration(

          color: AppTheme.lightDark,
          borderRadius: BorderRadius.circular(15)

        ),
        child:Icon(isSearch? CupertinoIcons.search: CupertinoIcons.check_mark_circled,
          size: 25,
          color: AppTheme.white,
        ),

      ),
    );
  }
}
