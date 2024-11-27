import 'package:cpdsite/configs/core_theme.dart';
import 'package:cpdsite/data/service/projects_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/data/service/service.dart';
import 'package:cpdsite/provider/app_provider.dart';
import 'package:cpdsite/provider/drawer_provider.dart';
import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:cpdsite/routing.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Service(dio: dio)),
        ChangeNotifierProvider(create: (_) => ProjectService(dio: dio)),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MaterialChild(
          provider: value,
        ),
      ),
    );
  }
}

class MaterialChild extends StatefulWidget {
  final AppProvider provider;

  const MaterialChild({super.key, required this.provider});

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  @override
  void initState() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Центр проектной деятельности',
      theme: AppTheme(widget.provider.scheme),
      routerConfig: router,
    );
  }
}
