import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/configs/app_theme.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/routing.dart';
import 'package:go_router/go_router.dart';

import '../configs/space.dart';
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
            color: AppTheme.isDark(context) ? Colors.white : Colors.black),
      ),
    );
  }
}
