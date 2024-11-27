import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cpdsite/widget/bevelled_container.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/animations/entrance_fader.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/generated/assets.dart';

import 'package:cpdsite/widget/social_links.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.02,
      padding: Space.all(),
      child: CenterContainer(
        size: size,
       type: 3,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.9,
                child: EntranceFader(
                  offset: const Offset(0, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Image.asset(
                    Assets.cpdHero,
                    height: size.width < 1200
                        ? size.height * 0.75
                        : size.height * 0.85,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                AppDimensions.normalize(30),
                AppDimensions.normalize(50),
                0,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.y1!,
                  Text(
                    "Центр",
                    style: AppText.h1w!.copyWith(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Проектной",
                    style: AppText.h1bw!.copyWith(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Деятельности",
                    style: AppText.h1w!.copyWith(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Space.y!,
                  EntranceFader(
                    offset: const Offset(-10, 0),
                    delay: const Duration(seconds: 1),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
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
                  ),
                  Space.y2!,
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
