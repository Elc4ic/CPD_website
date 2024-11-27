import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpdsite/widget/bevelled_container.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/generated/assets.dart';

import 'package:cpdsite/widget/social_links.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.02,
      padding: Space.all(),
      child: CenterContainer(
        size: size,
      type: 0,
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              right: -AppDimensions.normalize(25),
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  Assets.cpdHero,
                  height: AppDimensions.normalize(150),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                AppDimensions.normalize(10),
                AppDimensions.normalize(20),
                0,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.y!,
                  Text(
                    "Центр",
                    style: AppText.h2w!.copyWith(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Проектной",
                    style: AppText.h2bw!.copyWith(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Деятельности",
                    style: AppText.h2w!.copyWith(
                      fontFamily: 'Montserrat',
                      height: 1
                    ),
                  ),
                  Space.y!,
                  Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            ' Интернет-вещей',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Аэро-космос',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Робототехника',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Биотехнологии',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Нейротехнологии',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Инженерия',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                          TyperAnimatedText(
                            ' Присоединяйся :)',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1w,
                          ),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ],
                  ),
                  Space.y!,
                  const SocialLinks(scale: 1,color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
