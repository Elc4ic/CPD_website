import 'package:cpdsite/configs/app.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:cpdsite/provider/drawer_provider.dart';
import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:cpdsite/responsive/responsive.dart';
import 'package:cpdsite/sections/main/widgets/_mobile_drawer.dart';
import 'package:cpdsite/sections/main/widgets/_navbars.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:cpdsite/widget/arrow_on_top.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding:
                  Responsive.isDesktop(context) ? Space.navbarDesktop! : null,
              child: widget.child,
            ),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const NavBarTablet()
                : const NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ListView.builder(
      controller: scrollProvider.controller,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
    );
  }
}
