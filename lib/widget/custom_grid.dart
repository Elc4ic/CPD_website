import 'package:flutter/material.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/widget/project_card.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.width, required this.items, required this.cellWidth});

  final double width;
  final double cellWidth;
  final List<Project> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width ~/ cellWidth,
        childAspectRatio: 4/5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProjectCard(
            project: items[index],
          ),
        );
      },
    );
  }
}
