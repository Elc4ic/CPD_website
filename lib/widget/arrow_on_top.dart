import 'package:cpdsite/animations/entrance_fader.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:cpdsite/provider/app_provider.dart';
import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:provider/provider.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({super.key});

  @override
  ArrowOnTopState createState() => ArrowOnTopState();
}

class ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Positioned(
      bottom: AppDimensions.normalize(25),
      right: -4,
      child: EntranceFader(
        offset: const Offset(0, 20),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => scrollProvider.scroll(0),
                onHover: (isHovering) {
                  if (isHovering) {
                    setState(() {
                      isHover = true;
                    });
                  } else {
                    setState(() {
                      isHover = false;
                    });
                  }
                },
                child: Container(
                  padding: Space.all(0.3,0.1),
                  decoration: BoxDecoration(
                    color: appProvider.isDark ? Colors.white : Colors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    boxShadow: isHover
                        ? [
                            const BoxShadow(
                              blurRadius: 12.0,
                              offset: Offset(2.0, 3.0),
                            )
                          ]
                        : [],
                  ),
                  child: Icon(
                    Icons.rocket,
                    color: Theme.of(context).colorScheme.primary,
                    size: MediaQuery.of(context).size.height * 0.04,
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
