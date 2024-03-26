import 'dart:html';

import 'package:cpd_project_store/widgets/center_container.dart';
import 'package:cpd_project_store/widgets/footer/footer.dart';
import 'package:cpd_project_store/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../values/values.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/header/header.dart';
import '../../widgets/hover_row.dart';

part 'desktop_welcome.dart';
part 'mobile_welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileWidget: MobileWelcome(), desktopWidget: DesktopWelcome());
  }
}
