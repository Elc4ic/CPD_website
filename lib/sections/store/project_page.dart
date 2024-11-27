import 'dart:core';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cpdsite/data/service/projects_service.dart';
import 'package:cpdsite/data/service/service.dart';
import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:cpdsite/responsive/responsive.dart';
import 'package:cpdsite/widget/appbar.dart';
import 'package:cpdsite/widget/custom_grid.dart';
import 'package:cpdsite/widget/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/data/model/project.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../configs/space.dart';

part 'details/gallery.dart';

part 'details/passport.dart';

part 'details/team.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.id, required this.rep});

  final int id;
  final ProjectService rep;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late final scrollProvider = Provider.of<ScrollProvider>(context);

  List<bool> tabs = [true, false, false];

  @override
  void initState() {
    ProjectService.provider(context).getProject(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.rep.state == ServiceState.loading
        ? Center(child: CircularProgressIndicator())
        : widget.rep.state == ServiceState.failure
            ? ErrorCenter(
                onPressed: () {
                  ProjectService.provider(context).getProject(widget.id);
                },
                error: widget.rep.error!)
            : DefaultTabController(
                length: tabs.length,
                child: Stack(
                  children: [
                    Appbar(
                      go: "/store",
                      title: widget.rep.project.name,
                    ),
                    Container(
                      padding: Space.navbarMobile,
                      child: SingleChildScrollView(
                        controller: scrollProvider.controller,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Space.y2!,
                            Wrap(
                              spacing: AppDimensions.normalize(30),
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  padding: Space.all(),
                                  width: max(
                                      MediaQuery.of(context).size.width * 0.4,
                                      550),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        widget.rep.project.owner?.first_name ??
                                            "",
                                        style: AppText.b2,
                                      ),
                                      Space.y!,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: Space.all(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: 550,
                                      height: 300,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: Image.network(
                                            "${StaticUtils.apiUrl}${widget.rep.project.img ?? StaticUtils.defaultImage2}"),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Space.y2!,
                            Container(
                              height: AppDimensions.normalize(20),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                border: Border(
                                  top: BorderSide(
                                      width: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(50)),
                                ),
                              ),
                              padding: Space.all(),
                              child: OverflowBar(
                                spacing: 5,
                                alignment: MainAxisAlignment.start,
                                overflowAlignment: OverflowBarAlignment.start,
                                children: [
                                  TextButton(
                                      child: Text(
                                        'Пасспорт проекта',
                                        style: tabs[0]
                                            ? AppText.b2b
                                            : AppText.b2b
                                                ?.copyWith(color: Colors.grey),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tabs[0] = true;
                                          tabs[1] = false;
                                          tabs[2] = false;
                                        });
                                      }),
                                  VerticalDivider(),
                                  TextButton(
                                      child: Text(
                                        'Команда',
                                        style: tabs[1]
                                            ? AppText.b2b
                                            : AppText.b2b
                                                ?.copyWith(color: Colors.grey),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tabs[0] = false;
                                          tabs[1] = true;
                                          tabs[2] = false;
                                        });
                                      }),
                                  VerticalDivider(),
                                  TextButton(
                                      child: Text(
                                        'Галерея',
                                        style: tabs[2]
                                            ? AppText.b2b
                                            : AppText.b2b
                                                ?.copyWith(color: Colors.grey),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          tabs[0] = false;
                                          tabs[1] = false;
                                          tabs[2] = true;
                                        });
                                      }),
                                  VerticalDivider(),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: tabs[0],
                                child: Responsive.isDesktop(context)
                                    ? ProjectPassport(
                                        details: widget.rep.project)
                                    : ProjectPassportMobile(
                                        details: widget.rep.project)),
                            Visibility(
                              visible: tabs[1],
                              child: projectTeam(context, widget.rep.project),
                            ),
                            Visibility(
                              visible: tabs[2],
                              child:
                                  ProjectGallery(details: widget.rep.project),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
