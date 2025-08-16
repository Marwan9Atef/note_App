import 'package:flutter/cupertino.dart';
import 'package:note_app/core/theme/app_theme.dart';


class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key,required this.onTap});
final VoidCallback onTap;
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
        child:Icon(CupertinoIcons.search,
          size: 25,
          color: AppTheme.white,
        ),

      ),
    );
  }
}
