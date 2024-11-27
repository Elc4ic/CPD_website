import 'package:cpdsite/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:cpdsite/data/model/project.dart';

class EquipmentCard extends StatefulWidget {
  const EquipmentCard({super.key, required this.equipment});

  final Equipment equipment;

  @override
  State<EquipmentCard> createState() => _ProjCardState();
}

class _ProjCardState extends State<EquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Flexible(
            child: Center(
              child: Text(widget.equipment.name, style: AppText.h3b),
            ),
          ),
          Flexible(
            flex: 4,
            child: Image.network(
              "${StaticUtils.apiUrl}${widget.equipment.img}",
              fit: BoxFit.fitWidth,
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: Space.all(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarkdownBody(
                    selectable: true,
                    data: widget.equipment.description ?? 'content',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
