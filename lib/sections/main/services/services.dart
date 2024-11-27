import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/responsive/responsive.dart';
import 'package:cpdsite/utils/services_utils.dart';
import 'package:cpdsite/widget/custom_text_heading.dart';
import 'package:cpdsite/widget/services_card.dart';

part 'services_desktop.dart';
part 'services_mobile.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
