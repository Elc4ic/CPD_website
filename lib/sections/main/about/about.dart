import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/sections/main/about/about_desktop.dart';

import 'about_mobile.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: AboutMobile(),
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
