import 'package:flutter/material.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/data/service/project_service.dart';
import 'package:folio/sections/equipment/equipment_page.dart';
import 'package:folio/sections/main/main_section.dart';
import 'package:folio/sections/store/project_page.dart';
import 'package:folio/sections/store/store_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'configs/app_typography.dart';

enum AppRoute { main, store, project, signIn, equipment, chars }

GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: false,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.main.name,
          builder: (context, state) => const Body(),
          routes: [
            GoRoute(
              path: 'project/:id',
              name: AppRoute.project.name,
              pageBuilder: (context, state) {
                final productId = state.pathParameters['id']!;
                return MaterialPage(
                  child: Consumer<Service>(
                    builder: (context, value, _) => ProjectPage(
                      id: int.parse(productId),
                      rep: value,
                    ),
                  ),
                );
              },
            ),
            GoRoute(
              path: 'store',
              name: AppRoute.store.name,
              pageBuilder: (context, state) {
                return MaterialPage(
                    child: Consumer<Service>(
                        builder: (context, value, _) => Store(rep: value)));
              },
            ),
             GoRoute(
          path: 'equipment',
          name: AppRoute.equipment.name,
          pageBuilder: (context, state) {
            return MaterialPage(
                child: Consumer<Service>(
                    builder: (context, value, _) => EquipmentPage(rep: value)));
          },
        ),
          ],
        ),
      ],
    )
  ],
  errorBuilder: (context, state) => Center(
    child: Text(
      '404 - Page not found!',
      style: AppText.h2,
    ),
  ),
);
