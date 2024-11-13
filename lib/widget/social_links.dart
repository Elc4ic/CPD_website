import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/provider/app_provider.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    super.key, required this.scale,
  });
  final double scale;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Wrap(
      runSpacing: AppDimensions.normalize(10*scale),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding:
                  Responsive.isMobile(context) ? Space.all(0.2*scale, 0) : Space.h!,
              child: IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(12),
                icon: Image.network(
                  e.value,
                  color: appProvider.isDark ? Colors.white : Colors.black,
                  height: Responsive.isMobile(context)
                      ? AppDimensions.normalize(10*scale)
                      : AppDimensions.normalize(12*scale),
                ),
                iconSize: Responsive.isMobile(context)
                    ? AppDimensions.normalize(10*scale)
                    : AppDimensions.normalize(15*scale),
                onPressed: () => launchUrl(Uri.parse(StaticUtils.socialLinks[e.key])),
                hoverColor: AppTheme.core!.primary!,
              ),
            ),
          )
          .toList(),
    );
  }
}



