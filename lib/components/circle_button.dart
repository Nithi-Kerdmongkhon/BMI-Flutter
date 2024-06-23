import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const CircleBorder(),
            ),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff4c4f5e))),
        child: Icon(
          icon,
        ));
  }
}
