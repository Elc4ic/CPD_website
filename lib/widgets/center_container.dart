import 'package:flutter/material.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer(
      {super.key,
      required this.color,
      required this.widthNow,
      required this.child});

  final Color color;
  final double widthNow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widthNow < 1300 ? null : widthNow / 16 * 7.6,
        width: widthNow < 1600 ? null : 1600,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.all(Radius.circular(widthNow < 1600 ? 0 : 40)),
        ),
        child:
            Padding(padding: EdgeInsets.symmetric(vertical: 12), child: child),
      ),
    );
  }
}
