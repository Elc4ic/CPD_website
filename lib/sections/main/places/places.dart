import 'package:flutter/material.dart';
import 'package:cpdsite/responsive/responsive.dart';
import 'package:cpdsite/sections/main/places/places_desktop.dart';
import 'package:cpdsite/sections/main/places/places_mobile.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PlacesMobileTab(),
      tablet: PlacesMobileTab(),
      desktop: PlacesDesktop(),
    );
  }
}
