import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/generated/assets.dart';
import 'package:folio/sections/main/about/stepper.dart';

import 'package:folio/widget/custom_text_heading.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nКак начать?',
          ),
          const CustomSectionSubHeading(
            text: 'Вступление в центр проектной деятельности.',
          ),
          Space.y1!,
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  Assets.cpdMap,
                  height: height * 0.8,
                ),
              ),
              Expanded(
                flex: width < 1230 ? 2 : 1,
                child: Container(
                  padding: EdgeInsets.only(left: width < 1230 ? 25.0 : 0),
                  child: Center(
                    child: AnotherStepper(
                      stepperList: getStepperData(context),
                      stepperDirection: Axis.vertical,
                      iconWidth: 80,
                      iconHeight: 60,
                      activeBarColor: AppTheme.core!.primary!,
                      inActiveBarColor: AppTheme.core!.primary!,
                      inverted: false,
                      verticalGap: AppDimensions.normalize(14),
                      activeIndex: 0,
                      barThickness: 2,
                    ),
                  ),
                ),
              ),
              Container(
                width: width < 1230 ? width * 0.05 : width * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
