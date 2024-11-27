import 'package:flutter/material.dart';
import 'package:cpdsite/animations/entrance_fader.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:cpdsite/routing.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final String go;
  const NavBarActionButton({
    super.key,
    required this.label,
    required this.go,
  });

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: Space.h!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: MaterialButton(
          splashColor: Colors.white54,
          highlightColor: Colors.white54,
          hoverColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            context.go(go);
          },
          child: Padding(
            padding: Space.all(0.5, 0.45),
            child: Text(
              label,
              style: AppText.l1,
            ),
          ),
        ),
      ),
    );
  }
}
