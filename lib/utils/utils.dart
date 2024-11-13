import 'package:flutter/material.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/sections/main/about/about.dart';
import 'package:folio/sections/main/home/home.dart';
import 'package:folio/sections/main/places/places.dart';
import 'package:folio/sections/main/services/services.dart';

import '../sections/main/widgets/footer.dart';

class StaticUtils {
  static const String CPD_SIGN_IN_FORM =
      "https://docs.google.com/forms/d/e/1FAIpQLScsaWkskgiHnPrlSfHysnT3_RHx6p5O6_YP_9zbt-vRrM_fNA/viewform";
  static const String CPD_FORM_PROJECT =
      "https://docs.google.com/forms/d/e/1FAIpQLSce1VDFfojX32fSMMWnk3B059J_eQcLMVPGRmMtq0susAgJuA/viewform";

  static const List<String> socialIconURL = [
    "https://img.icons8.com/?size=100&id=2454&format=png&color=000000",
    "https://img.icons8.com/?size=100&id=37326&format=png&color=000000",
    "https://img.icons8.com/?size=100&id=lUktdBVdL4Kb&format=png&color=000000",
  ];

  static const List<String> socialLinks = [
    "https://vk.com/cpddvfu",
    "https://www.youtube.com/@CPD-DVFU",
    "https://t.me/cpddvfu",
  ];

  static List<Widget> projectCardTags(List<Tag> tags) {
    return List.generate(
      tags.length,
      (index) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text('#${tags[index].name}', style: AppText.l2b!),
          ),
        ],
      ),
    );
  }
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Places(),
    Footer(),
  ];
}
