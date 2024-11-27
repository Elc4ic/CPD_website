import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cpdsite/data/model/project.dart';
import 'package:cpdsite/sections/store/project_page.dart';
import 'package:cpdsite/widget/project_card.dart';
import 'package:flutter/material.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid(
      {super.key,
      required this.width,
      required this.items,
      required this.cellWidth});

  final double width;
  final double cellWidth;
  final List<Project> items;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: max(width ~/ cellWidth, 1),
        childAspectRatio: 4 / 5,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ProjectCard(
          project: items[index],
        );
      },
    );
  }
}

class ImageGrid extends StatelessWidget {
  const ImageGrid(
      {super.key,
        required this.width,
        required this.items,
        required this.cellWidth, required this.controller, required this.size});

  final double width;
  final double cellWidth;
  final List<Widget> items;
  final CarouselSliderController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: max(width ~/ cellWidth, 1),
        childAspectRatio: 16/9,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => imageDialog(context, controller, index, items,size),
          child: items[index],
        );
      },
    );
  }
}
