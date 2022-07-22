import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc/components/app_bar_widget.dart';
import 'package:imc/components/bottom_button_widget.dart';
import 'package:imc/theme/app_colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key, 
    required this.height, 
    required this.weight,
    }) : super(key: key);

  final int height;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(
        leftIcon: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30, 
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
            'RESULTADO', 
            style: TextStyle(
              color: AppColors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 357,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_calculateIMC().toStringAsFixed(1),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                  ),
                  ),
                  Text(_resultIMC(),style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                  ),
                ],
              ),
            ),
            const Spacer(),
                  BottomButtonWidget(
                    title: 'CALCULAR NOVAMENTE',
                    onPressed: () => Navigator.pop(context),
                  ),
         ],
        ),
      ),
    );
  }

  double _calculateIMC() {
    return weight / (pow(height / 100, 2));
  }

  String _resultIMC() {
    double imc = _calculateIMC();
    if (imc < 18.5) {
      return 'Abaixo do Peso';
    } else if (imc >= 18.5 && imc <= 24.9) {
      return 'Peso Normal';
    } else if (imc >= 25 && imc <= 29.9) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc <= 34.9) {
      return 'Obesidade Grau I';
    } else if (imc > 35 && imc <= 39.9) {
      return 'Obesidade Grau II';
    } else {
      return 'Obesidade Grau III ou Mórbida';
    }
  }
}