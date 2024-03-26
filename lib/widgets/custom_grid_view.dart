import 'dart:math';

import 'package:cpd_project_store/widgets/project_card.dart';
import 'package:flutter/material.dart';

import '../data/model/project.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.width, required this.items});

  final double width;
  final List<Project> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width ~/ 350,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ProjCard(details: items[index]);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
