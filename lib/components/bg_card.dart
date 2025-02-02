import 'package:flutter/cupertino.dart';

class BgCard extends StatelessWidget {
  final Widget? child;
  final VoidCallback callback;
  const BgCard({super.key, this.child, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: Container(
          margin: const EdgeInsets.all(15),
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              color: const Color(0x0ff1df33),
              borderRadius: BorderRadius.circular(15)),
          child: child,
        ));
  }
}
