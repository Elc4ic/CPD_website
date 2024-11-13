import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
          color: appProvider.isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isHover
                  ? AppTheme.core!.primary!.withAlpha(100)
                  : Colors.black.withAlpha(100),
              blurRadius: 5.0,
              offset: const Offset(0.0, 0.0),
            )
          ]),
      child: InkWell(
        onTap: () {
          context.push('/project/${widget.project.id}');
        },
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              isHover = true;
            });
          } else {
            setState(() {
              isHover = false;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: Space.all(1,0.5),
                  child: Text(widget.project.status ?? "unknown",
                      style: AppText.b2),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    widget.project.img ?? "",
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Space.all(1, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: List.generate(widget.project.tags.length,
                              (index) {
                            return Chip(
                              label: Text(widget.project.tags[index].name,
                                  style: AppText.b2),
                            );
                          }),
                        ),
                        Space.y!,
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.project.name,
                                style: AppText.b1b,
                              ),
                              Space.y!,
                              Text(
                                "Руководитель: ${widget.project.owner}",
                                style: AppText.b2,
                              ),
                            ]),
                      ],
                    ),
                  ),
                  Spacer(),
                  Divider(),
                  Padding(
                    padding: Space.all(),
                    child: Text(
                      "Создан: ${widget.project.created}",
                      style: AppText.b2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
