import 'package:cpdsite/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/data/model/project.dart';
import 'package:cpdsite/provider/app_provider.dart';
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
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isHover
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black12,
              blurRadius: 10.0,
              offset: const Offset(0.0, 0.0),
            )
          ]),
      child: InkWell(
        onTap: () {
          context.go('/store/${widget.project.id}');
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: Space.h!,
                    child: Text(
                        widget.project.status == 1 ? "Активен" : "Неизвестно",
                        style: AppText.b3),
                  ),
                )),
            Expanded(
                flex: 6,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    "${StaticUtils.apiUrl}${widget.project.img ?? StaticUtils.defaultImage2}",
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: Space.all(1, 0.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children:
                              StaticUtils.projectCardTags(widget.project.tags),
                        ),
                        Space.y!,
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.project.name,
                                style: AppText.b2b,
                              ),
                              Space.y!,
                              Text(
                                "Руководитель: ${widget.project.owner?.last_name} ${widget.project.owner?.first_name} ",
                                style: AppText.b3,
                              ),
                            ]),
                      ],
                    ),
                  ),
                  Spacer(),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: Space.all(),
                    child: Text(
                      "Заказчик: ${widget.project.customer}",
                      style: AppText.b3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
