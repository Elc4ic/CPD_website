import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';

import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/configs/space.dart';


List<StepperData> getStepperData(BuildContext context) {
  String STEP1_TITLE = "Заявка на вступление";
  String STEP2_TITLE = "Посещение центра";
  String STEP3_TITLE = "Обучение";
  String STEP4_TITLE = "Проектная работа";

  String STEP1_TEXT = "Заполняй форму и переходи к шагу 2.";
  String STEP2_TEXT =
      "Приходи в Центр проектной деятельности. Мы расскажем о нашей деятельности и покажем возможности.";
  String STEP3_TEXT =
      "Выстроим индивидуальную траекторию и поможем освоить новые навыки и получить компетенции.";
  String STEP4_TEXT =
      "Подключим к уже существующим проектам или вместе создади что-то новое.";
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          STEP1_TITLE,
          textStyle: AppText.h3,
        ),
        subtitle: StepperText(
          STEP1_TEXT,
          textStyle: AppText.l1,
        ),
        iconWidget: Container(
          margin: Space.h,
          padding: Space.all(),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Icon(Icons.looks_one, color: Colors.white),
        )),
    StepperData(
        title: StepperText(
          STEP2_TITLE,
          textStyle: AppText.h3,
        ),
        subtitle: StepperText(
          STEP2_TEXT,
          textStyle: AppText.l1,
        ),
        iconWidget: Container(
          margin: Space.h,
          padding: Space.all(),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Icon(Icons.looks_two, color: Colors.white),
        )),
    StepperData(
        title: StepperText(
          STEP3_TITLE,
          textStyle: AppText.h3,
        ),
        subtitle: StepperText(
          STEP3_TEXT,
          textStyle: AppText.l1,
        ),
        iconWidget: Container(
          margin: Space.h,
          padding: Space.all(),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
    StepperData(
      title: StepperText(
        STEP4_TITLE,
        textStyle: AppText.h3,
      ),
      subtitle: StepperText(
        STEP4_TEXT,
        textStyle: AppText.l1,
      ),
      iconWidget: Container(
        margin: Space.h,
        padding: Space.all(),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.looks_4, color: Colors.white),
      ),
    ),
  ];
  return stepperData;
}
