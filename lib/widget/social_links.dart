import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/provider/app_provider.dart';
import 'package:cpdsite/responsive/responsive.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    super.key,
    required this.scale,this.color,
  });

  final double scale;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: AppDimensions.normalize(10 * scale),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: Responsive.isMobile(context)
                  ? Space.all(0.2 * scale, 0)
                  : Space.h!,
              child: IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(12),
                icon: Image.network(
                  e.value,
                  color: color,
                  height: Responsive.isMobile(context)
                      ? AppDimensions.normalize(10 * scale)
                      : AppDimensions.normalize(12 * scale),
                ),
                iconSize: Responsive.isMobile(context)
                    ? AppDimensions.normalize(10 * scale)
                    : AppDimensions.normalize(15 * scale),
                onPressed: () =>
                    launchUrl(Uri.parse(StaticUtils.socialLinks[e.key])),
                hoverColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
          .toList(),
    );
  }
}
