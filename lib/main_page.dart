import 'package:flutter/material.dart';
import 'package:imc/components/app_bar_widget.dart';
import 'package:imc/components/bottom_button_widget.dart';
import 'package:imc/components/user_input_widget.dart';
import 'package:imc/result_page.dart';
import 'package:imc/theme/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int heightPerson = 170;
  int weightPerson = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppBarWidget(
        leftIcon: Icon(
          Icons.person,
          color: AppColors.white,
          ),
      ),
      body: Column(
        children:  [
         const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: UserInputWidget(
              title: 'Qual a sua altura?',
              value: heightPerson.toString(),
              unit: 'cm',
              onDecrease:() {
                setState(() {
                  heightPerson--;
                });
              },
              onIncrease:() {
                setState(() {
                  heightPerson++;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: UserInputWidget(
              title: 'Qual o seu peso?',
              value: weightPerson.toString(),
              unit: 'kg',
              onDecrease:() {
                setState(() {
                  weightPerson--;
                });
              },
              onIncrease:() {
                setState(() {
                  weightPerson++;
                });
              },
            ),
          ),
          const Spacer(),
           BottomButtonWidget(
            title: 'Calcular Resultado',
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    height: heightPerson,
                    weight: weightPerson,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}