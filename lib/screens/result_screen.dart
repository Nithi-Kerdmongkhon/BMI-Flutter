import 'package:flutter/material.dart';
import 'package:week5/components/bg_card.dart';
import 'package:week5/constants.dart';

import '../bmi.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.weightKg,
    required this.heightCm,
  });

  final int weightKg;
  final int heightCm;

  @override
  Widget build(BuildContext context) {
    var (bmi, category, message) = BMI.calculate(
      heightCm: heightCm,
      weightKg: weightKg,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Result"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Your Result",
                style: kLabeNumberTextStyle,
              ),
            )),
            Expanded(
              flex: 12,
              child: BgCard(
                callback: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      category,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )),
                    Center(
                        child: Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500),
                    )),
                    Center(
                        child: Text(
                      message,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                      ),
                    )),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffeb1555),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 80),
                  ),
                ),
                child: const Text(
                  'Re_Calculate BMI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}
