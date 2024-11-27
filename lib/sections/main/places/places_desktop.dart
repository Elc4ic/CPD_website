import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/utils/project_utils.dart';
import 'package:cpdsite/widget/custom_text_heading.dart';
import 'package:go_router/go_router.dart';

import '../../../generated/assets.dart';

class PlacesDesktop extends StatefulWidget {
  const PlacesDesktop({super.key});

  @override
  State<PlacesDesktop> createState() => _PlacesDesktopState();
}

class _PlacesDesktopState extends State<PlacesDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nПространства для работы",
          ),
          const CustomSectionSubHeading(
            text:
                "Мы обладаем всем необходимым оборудованием для воплощения идей в жизнь.\n\n",
          ),
          Space.y2!,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: Space.h!,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ProjectUtils.PROJECT_SPACE, style: AppText.h2b),
                      Text(ProjectUtils.PROJECT_SPACE_TEXT, style: AppText.b2),
                      Space.y!,
                      SizedBox(
                        height: AppDimensions.normalize(14),
                        width: AppDimensions.normalize(50),
                        child: OutlinedButton(
                          onPressed: () => context.go("/equipment"),
                          child: Text(
                            'Подробнее',
                            style: AppText.l1b,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  Assets.cpdOffice,
                  height: height * 0.8,
                ),
              ),
            ],
          ),
          Space.y2!,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset(
                  Assets.cpdMaster,
                  height: height * 0.8,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Space.h!,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ProjectUtils.WORKSHOP, style: AppText.h2b),
                        Text(ProjectUtils.WORKSHOP_TEXT, style: AppText.b2),
                        Space.y!,
                        SizedBox(
                          height: AppDimensions.normalize(14),
                          width: AppDimensions.normalize(50),
                          child: OutlinedButton(
                            onPressed: () => context.go("/equipment"),
                            child: Text(
                              'Подробнее',
                              style: AppText.l1b,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
