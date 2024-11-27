import 'package:flutter/material.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/provider/app_provider.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCardBackWidget extends StatelessWidget {
  const ServiceCardBackWidget({super.key,
    required this.serviceDesc,
    required this.serviceTitle,
  });

  final String serviceDesc;
  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          serviceDesc,
          style: AppText.l1,
        ),
        Divider(
          color: appProvider.isDark ? Colors.white : Colors.black38,
        ),
        SizedBox(
          height: AppDimensions.normalize(14),
          width: AppDimensions.normalize(60),
          child: MaterialButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              launchUrl(Uri.parse(StaticUtils.CPD_SIGN_IN_FORM));
            },
            child: Text(
              'Вступить',
              style: AppText.b2!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
