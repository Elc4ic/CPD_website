import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/configs/app_theme.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/widget/social_links.dart';
import 'package:provider/provider.dart';

import '../../../configs/space.dart';
import '../../../generated/assets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  //footer
  final String DVFU = "Дальневосточный федеральный университет, 2012-2024";
  final String FOOTER =
      "Инфраструктура для выполнения\nнаучно-технических проектов и\nопытно-конструкторских работ.";
  final String WANT_JOIN = "Желаешь быть в курсе всех\nновостей,подпишись.";
  final String ADDRES = "ДВФУ, корпус С, С305";
  final String CPD_MAIL = "cpd@dvfu.ru";

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: AppDimensions.normalize(10)),
      padding: Space.all(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: Space.all(),
            width: AppDimensions.normalize(120),
            height: AppDimensions.normalize(60),
            decoration: BoxDecoration(
                color: appProvider.isDark ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FOOTER,
                  style: AppText.b2,
                ),
                SocialLinks(scale: 0.55)
              ],
            ),
          ),
          Container(
            margin: Space.h,
            width: AppDimensions.normalize(120),
            height: AppDimensions.normalize(60),
            decoration: BoxDecoration(
                color: appProvider.isDark ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    blurRadius: 12.0,
                    offset: const Offset(0.0, 0.0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Контакты',
                  style: AppText.b2b,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mail,
                      color: AppTheme.core!.primary,
                    ),
                    Text(
                      CPD_MAIL,
                      style: AppText.b2!,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppTheme.core!.primary,
                    ),
                    Text(
                      ADDRES,
                      style: AppText.b2!,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Image.asset(
              Assets.cpdFacebookPost42,
              width: AppDimensions.normalize(100),
              height: AppDimensions.normalize(30),
            ),
            SizedBox(
              width: AppDimensions.normalize(60),
              height: AppDimensions.normalize(30),
              child: SvgPicture.asset(Assets.assetsCpdBlack,
                  color:
                      AppTheme.isDark(context) ? Colors.white : Colors.black),
            ),
          ])
        ],
      ),
    );
  }
}
