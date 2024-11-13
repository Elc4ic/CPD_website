import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/app_theme.dart';
import '../../../configs/app_typography.dart';
import '../../../provider/app_provider.dart';
import '../../../provider/scroll_provider.dart';
import '../../../utils/navbar_utils.dart';
import '../../../utils/utils.dart';
import '../../../widget/navbar_logo.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Drawer(
      child: Material(
        color: appProvider.isDark ? Colors.grey[900] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: AppTheme.core!.primary!,
                ),
                title: const Text(
                  "Dark Mode",
                ),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: appProvider.isDark,
                  onChanged: (value) {
                    appProvider
                        .setTheme(value ? ThemeMode.dark : ThemeMode.light);
                  },
                  activeColor: AppTheme.core!.primary,
                ),
              ),
              const Divider(),
              ...NavBarUtils.names.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    hoverColor: AppTheme.core!.primary!.withAlpha(70),
                    onPressed: () {
                      context.go(e.route);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(
                        e.icon,
                        color: AppTheme.core!.primary,
                      ),
                      title: Text(
                        e.name,
                        style: AppText.l1,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: AppTheme.core!.primary!.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: AppTheme.core!.primary!)),
                  onPressed: () =>
                      launchUrl(Uri.parse(StaticUtils.CPD_SIGN_IN_FORM)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Вступить',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
