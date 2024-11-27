import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:go_router/go_router.dart';

import '../generated/assets.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.normalize(20),
      height: AppDimensions.normalize(12),
      child: InkWell(
        onTap: () {
          context.go('/');
        },
        child: SvgPicture.asset(Assets.assetsCpdBlack,
            color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
