import 'package:flutter/material.dart';
import 'package:imc/theme/app_colors.dart';

class UserInputWidget extends StatelessWidget {
  const UserInputWidget({
    Key? key,
    this.height, 
    required this.title,
    required this.value, 
    required this.onIncrease, 
    required this.onDecrease, 
    required this.unit, 
    this.onIncreaseHold, 
    this.onIncreaseRelease, 
    this.onDecreaseHold, 
    this.onDecreaseRelease,
    }) : super(key: key);

  final String title;
  final double? height;
  final String value;
  final String unit;
  final void Function() onIncrease;
  final void Function()? onIncreaseHold;
  final void Function()? onIncreaseRelease;
  final Function onDecrease;
  final Function? onDecreaseHold;
  final Function? onDecreaseRelease;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, 
          style: const TextStyle(
            color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: height ?? 170,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => onDecrease(),
                      onTapDown: (_){
                        if (onDecreaseHold != null) {
                          onDecreaseHold!();
                        }
                      },
                      onTapUp: (details) {
                        if (onDecreaseRelease != null ) {
                          onDecreaseRelease!();
                        }
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryDarkColor,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.white,
                          size: 42,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 108,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            value,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 50,
                            ),
                          ),
                          Text(
                            unit,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onIncrease,
                      onTapDown: (_) {
                        if(onIncreaseHold != null) {
                          onIncreaseHold!();
                        }
                      },
                      onTapUp: (details) {
                        if (onIncreaseRelease != null) {
                          onIncreaseRelease!();
                        }
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryDarkColor,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 42,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ],
    );
  }
}