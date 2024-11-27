import 'package:cpdsite/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/provider/app_provider.dart';
import 'package:cpdsite/widget/social_links.dart';
import 'package:provider/provider.dart';

import '../../../configs/space.dart';
import '../../../generated/assets.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  final String DVFU = "Дальневосточный федеральный университет, 2012-2024";
  final String FOOTER =
      "Инфраструктура для выполнения\nнаучно-технических проектов и\nопытно-конструкторских работ.";
  final String WANT_JOIN = "Желаешь быть в курсе всех\nновостей,подпишись.";
  final String ADDRES = "ДВФУ, корпус С, С305";
  final String CPD_MAIL = "cpd@dvfu.ru";


  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: Space.all(),
      height: AppDimensions.normalize(StaticUtils.footer),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 4.0, spreadRadius: 1.0, color: Colors.grey)
        ],
        color: appProvider.isDark ? Colors.black : Colors.white,
      ),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Контакты',
                style: AppText.b2b,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    CPD_MAIL,
                    style: AppText.b2!,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    ADDRES,
                    style: AppText.b2!,
                  ),

                ],
              ),
              SocialLinks(scale: 0.5)
            ],
          ),
          Visibility(
            visible: width > 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FOOTER,
                  style: AppText.b2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppDimensions.normalize(40),
            height: AppDimensions.normalize(26),
            child: SvgPicture.asset(Assets.assetsCpdBlack,
                color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
