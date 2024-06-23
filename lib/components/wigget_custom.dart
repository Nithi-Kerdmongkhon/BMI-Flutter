import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class Emint extends StatefulWidget {
  Emint({
    super.key,
    required this.value,
    required this.textlabel,
    required this.onValueChanged,
  });

  int value;
  final String textlabel;
  final Function(int) onValueChanged;

  @override
  State<Emint> createState() => _EmintState();
}

class _EmintState extends State<Emint> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.textlabel,
          style: kLabeNumberTextStyle,
        ),
        Text(
          widget.value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () => setState(() {
                widget.onValueChanged(widget.value + 1);
              }),
              icon: FontAwesomeIcons.plus,
            ),
            CircleButton(
              onPressed: () => setState(() {
                widget.onValueChanged(widget.value - 1);
              }),
              icon: FontAwesomeIcons.minus,
            ),
          ],
        )
      ],
    );
  }
}
