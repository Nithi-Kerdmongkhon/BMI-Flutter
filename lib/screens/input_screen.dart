import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:week5/constants.dart';
import 'package:week5/screens/result_screen.dart';
import '../components/bg_card.dart';
import '../components/bg_card_content.dart';
import '../components/wigget_custom.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  var maleCardColor = kInActiveColor;
  var femalCardColor = kActiveColor;
  var inputHeight = 183;
  var inputAge = 18;
  var inputWeight = 80;

  void toggleGenderCard() {
    var colorHolder = maleCardColor;
    maleCardColor = femalCardColor;
    femalCardColor = colorHolder;
    log('call toggleGenderCard male:$maleCardColor female:$femalCardColor');
  }

  void updateAge(int value) {
    setState(() {
      inputAge += value;
    });
  }

  void updateWeight(int value) {
    setState(() {
      inputWeight += value;
    });
  }

  void updateHeight(int value) {
    setState(() {
      inputHeight = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("W5 BMI Calculator"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleGenderCard();
                          });
                        },
                        child: Expanded(
                            child: BgCard(
                          callback: () => setState(() => toggleGenderCard()),
                          child: BgCardContent(
                              icon: FontAwesomeIcons.mars,
                              iconSize: 60,
                              textLable: 'Male',
                              color: maleCardColor),
                        )))),
                Expanded(
                    child: BgCard(
                  callback: () => setState(() => toggleGenderCard()),
                  child: BgCardContent(
                      icon: FontAwesomeIcons.venus,
                      iconSize: 60,
                      textLable: 'Female',
                      color: femalCardColor),
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BgCard(
                  callback: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Height"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(inputHeight.toString(), style: kNumberTextStyle),
                          const Text("cm")
                        ],
                      ),
                      Expanded(
                          child: Slider(
                        max: 250,
                        min: 50,
                        activeColor: const Color(0xffeb1555),
                        onChanged: (double value) {
                          setState(() {
                            inputHeight = value.toInt();
                          });
                        },
                        value: inputHeight.toDouble(),
                      )),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: BgCard(
                  callback: () {},
                  child: Emint(
                      value: inputWeight,
                      textlabel: 'Weight',
                      onValueChanged: (vd) {
                        setState(() {
                          inputWeight = vd;
                        });
                      }),
                )),
                Expanded(
                    child: BgCard(
                  callback: () {},
                  child: Emint(
                    value: inputAge,
                    textlabel: 'Age',
                    onValueChanged: (newValue) {
                      setState(() {
                        inputAge = newValue;
                      });
                    },
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: 75,
            color: const Color(0xffeb1555),
            margin: const EdgeInsets.only(top: 0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                weightKg: inputWeight,
                                heightCm: inputHeight,
                              )));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text("Calculate Your BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
