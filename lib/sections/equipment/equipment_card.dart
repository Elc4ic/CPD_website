import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/configs/space.dart';
import 'package:folio/data/model/project.dart';
import 'package:folio/generated/assets.dart';

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
      child: Padding(
        padding: Space.all(),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Image.network(
                widget.equipment.img ?? Assets.cpd5b0deb6102a55813521cc732,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: Space.all(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(widget.equipment.name, style: AppText.b2),
                    ),
                    Divider(),
                    MarkdownBody(
                      selectable: true,
                      data:
                          '${widget.equipment.content ?? 'Markdown here'}😀😀😀😀😀',
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
