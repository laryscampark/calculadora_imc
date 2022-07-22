import 'package:flutter/cupertino.dart';
import 'package:imc/theme/app_colors.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget({
    Key? key, 
    required this.onPressed, 
    required this.title,
    }) : super(key: key);

  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return CupertinoButton(
      padding: EdgeInsets.zero, 
      onPressed:()=> onPressed(),
      child: Container(
        color: AppColors.primaryDarkColor,
        height: 65 + paddingBottom,
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ), 
    );
  }
}