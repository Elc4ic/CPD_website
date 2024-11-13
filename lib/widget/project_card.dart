import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {

  final Project project;

  const ProjectCard({
    super.key,
    required this.project
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
      child: Container(
        margin: Space.h,
        padding: Space.all(),
        width: AppDimensions.normalize(150),
        height: AppDimensions.normalize(90),
        decoration: BoxDecoration(
            color: appProvider.isDark ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? AppTheme.core!.primary!.withAlpha(100)
                    : Colors.black.withAlpha(100),
                blurRadius: 12.0,
                offset: const Offset(0.0, 0.0),
              )
            ]),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.project.annotation,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHover ? 0.0 : 1.0,
              child: FittedBox(
                fit: BoxFit.fill,
                child: widget.project.img != null
                    ? SizedBox(
                  height: AppDimensions.normalize(90),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Image.asset(
                          fit: BoxFit.fill,
                          widget.project.img!,
                        ),
                      ),
                      Expanded(
                        child:
                        Text(widget.project.name, style: AppText.b2b),
                      )
                    ],
                  ),
                )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
