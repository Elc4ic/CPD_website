import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.go, required this.title});

  final String go;
  final String title;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: Space.all(),
      height: AppDimensions.normalize(24),
      decoration: BoxDecoration(
        color: appProvider.isDark ? Colors.black : Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 4.0, spreadRadius: 1.0, color: Colors.grey)
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.go(go);
            },
            icon: Icon(Icons.arrow_back),
          ),
          Space.x!,
          Text(
            title,
            style: AppText.b2b,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
