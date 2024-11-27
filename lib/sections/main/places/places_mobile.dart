import 'package:cpdsite/widget/custom_text_heading.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/generated/assets.dart';
import 'package:cpdsite/utils/project_utils.dart';
import 'package:go_router/go_router.dart';

class PlacesMobileTab extends StatelessWidget {
  const PlacesMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: Space.h2!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nГде работать?",
          ),
          const CustomSectionSubHeading(
            text: "Мы обладаем всем необходимым оборудованием.\n\n",
          ),
          Space.y!,
          Text(ProjectUtils.PROJECT_SPACE, style: AppText.h3b),
          Text(ProjectUtils.PROJECT_SPACE_TEXT, style: AppText.b2),
          Space.y!,
          SizedBox(
            height: height * 0.5,
            child: Image.asset(Assets.cpdOffice),
          ),
          Space.y!,
          Text(ProjectUtils.WORKSHOP, style: AppText.h3b),
          Text(ProjectUtils.WORKSHOP_TEXT, style: AppText.b2),
          Space.y!,
          SizedBox(
            height: height * 0.5,
            child: Image.asset(Assets.cpdMaster),
          ),
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
    );
  }
}
