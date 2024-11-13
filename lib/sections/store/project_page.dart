import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/data/service/project_service.dart';
import 'package:folio/utils/utils.dart';

import '../../configs/space.dart';

part 'details/gallery.dart';

part 'details/passport.dart';

part 'details/team.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.id, required this.rep});

  final int id;
  final Service rep;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  ScrollController controller = ScrollController();

  List<bool> tabs = [true, false, false];

  @override
  void initState() {
    Service.state(context).getProject(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.rep.isLoading
        ? const Center(child: CircularProgressIndicator())
        : DefaultTabController(
            length: tabs.length,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Wrap(
                    spacing: AppDimensions.normalize(30),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.rep.project.name,
                            style: AppText.h3,
                          ),
                          Text(
                            "Руководитель проекта:",
                            style: AppText.b2b,
                          ),
                          Text(
                            widget.rep.project.owner,
                            style: AppText.b2,
                          ),
                          Space.y2!,
                          Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: StaticUtils.projectCardTags(
                                widget.rep.project.tags),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: 550,
                          height: 300,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(widget.rep.project.img!),
                          ),
                        ),
                      )
                    ],
                  ),
                  Space.y2!,
                  OverflowBar(
                    spacing: 5,
                    alignment: MainAxisAlignment.start,
                    overflowAlignment: OverflowBarAlignment.start,
                    children: [
                      TextButton(
                          child: Text(
                            'Пасспорт проекта',
                            style: tabs[0]
                                ? AppText.b2
                                : AppText.b2?.copyWith(color: Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              tabs[0] = true;
                              tabs[1] = false;
                              tabs[2] = false;
                            });
                          }),
                      TextButton(
                          child: Text(
                            'Команда',
                            style: tabs[1]
                                ? AppText.b2
                                : AppText.b2?.copyWith(color: Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              tabs[0] = false;
                              tabs[1] = true;
                              tabs[2] = false;
                            });
                          }),
                      TextButton(
                          child: Text(
                            'Галерея',
                            style: tabs[2]
                                ? AppText.b2
                                : AppText.b2?.copyWith(color: Colors.grey),
                          ),
                          onPressed: () {
                            setState(() {
                              tabs[0] = false;
                              tabs[1] = false;
                              tabs[2] = true;
                            });
                          }),
                    ],
                  ),
                  Divider(),
                  Visibility(
                    visible: tabs[0],
                    child: projectPassport(context, widget.rep.project),
                  ),
                  Visibility(
                      visible: tabs[1],
                      child: projectTeam(context, widget.rep.project)),
                  Visibility(
                    visible: tabs[2],
                    child: projectGallery(context, widget.rep.project),
                  ),
                ],
              ),
            ),
          );
  }
}

/*if (
state is ProjectDetailsLoadingFailure) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Text(state.exception.toString()),
const Text('Please try againg later'),
SizedBox(height: widthNow / 30),
TextButton(
onPressed: () {
_projectDetailsBloc
    .add(LoadProjectDetails(id: widget.id));
},
child: const Text('Try againg'),
),
],
),
);
}
return const Center(child: CircularProgressIndicator());*/
