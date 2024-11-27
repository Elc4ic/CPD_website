import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:flutter/material.dart';

class ErrorCenter extends StatelessWidget {
  const ErrorCenter({super.key, required this.onPressed, required this.error});

  final Function() onPressed;
  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Something went wrong!",
            style: AppText.h2b,
          ),
          Text(error.toString()),
          Space.y!,
          IconButton(onPressed: onPressed, icon: Icon(Icons.error)),
        ],
      ),
    );
  }
}
