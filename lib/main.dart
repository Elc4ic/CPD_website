import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'data/repository/abstract_project_repository.dart';
import 'data/repository/project_repository.dart';

void main() {
  setPathUrlStrategy();
  GetIt.I.registerLazySingleton<AbstractProjectRepository>(
    () => ProjectRepository(),
  );

  runApp(const App());
}
