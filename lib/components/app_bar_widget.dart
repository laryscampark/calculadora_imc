import 'package:flutter/material.dart';
import 'package:imc/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({Key? key, required this.leftIcon}) : super(key: key);

  final Widget leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: AppColors.appBarColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: .10,
            left: 15,
            right: 15,
            ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leftIcon,
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo_kode_start.png',
                  width: 115,
                  height: 77,
                  ),
                  const Text(
                    'CALCULADORA DE IMC',
                    style: TextStyle(
                      color: AppColors.white),
                      ),
                ],
              ), 
                const Icon(
                  Icons.menu, 
                  color: AppColors.white,
                  ),
                ],
            ),
        ),
        ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(130);
}