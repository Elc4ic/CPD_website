import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../animations/entrance_fader.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/space.dart';
import '../../../provider/app_provider.dart';
import '../../../provider/drawer_provider.dart';
import '../../../utils/navbar_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/navbar_logo.dart';
import 'package:universal_html/html.dart' as html;

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 4.0, spreadRadius: 1.0, color: Colors.grey)
        ],
        color: appProvider.isDark ? Colors.black : Colors.white,
      ),
      width: AppDimensions.normalize(StaticUtils.navbar),
      padding: Space.all(0.2),
      child: Column(
        children: [
          Container(
              height: AppDimensions.normalize(22),
              child: const NavBarLogo(),
          ),
          Space.y!,
          ...NavBarUtils.names.map(
                (e) =>
                Padding(
                  padding: Space.v!,
                  child: IconButton(
                    tooltip: e.name,
                    highlightColor: Colors.white54,
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {
                      context.go(e.route);
                    },
                    icon: Icon(
                      e.icon,
                    ),
                  ),
                ),
          ),
          Space.y!,
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              height: AppDimensions.normalize(20),
              minWidth: AppDimensions.normalize(20),
              hoverColor: Theme
                  .of(context)
                  .colorScheme
                  .primary
                  .withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Theme
                      .of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              onPressed: () {
                html.window.open(
                  StaticUtils.CPD_SIGN_IN_FORM,
                  "pdf",
                );
              },
              child: Icon(Icons.add),
            ),
          ),
          Spacer(),
          Switch(
            inactiveTrackColor: Colors.grey,
            value: appProvider.isDark,
            onChanged: (value) {
              appProvider.setTheme(
                !value ? themeList[0] : themeList[1],
              );
            },
            activeColor: Theme
                .of(context)
                .colorScheme
                .primary,
          ),
          Space.x!,
        ],
      ),
    );
  }
}

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(10),
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Space.xm!,

          const NavBarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
