import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:cpdsite/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer(
      {super.key, required this.child, required this.size, required this.type});

  final Size size;
  final int type;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: type != 1
            ? EdgeInsets.only(top: AppDimensions.normalize(20))
            : null,
        padding: Space.all(0.5),
        height: size.height*0.96,
        child: Container(
            padding: Space.all(0.5),
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: Svg(
                scale: 4,
                type == 0
                    ? Assets.cpdBevelMob
                    : type == 1
                        ? Assets.cpdBevelCard
                        : Assets.cpdBevelTab,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            )),
            child: child),
      ),
    );
  }
}
