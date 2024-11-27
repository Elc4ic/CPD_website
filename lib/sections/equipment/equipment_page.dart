import 'dart:math';

import 'package:cpdsite/provider/scroll_provider.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:cpdsite/widget/appbar.dart';
import 'package:cpdsite/widget/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';
import 'package:cpdsite/data/service/service.dart';
import 'package:cpdsite/sections/equipment/equipment_card.dart';
import 'package:cpdsite/sections/main/widgets/footer.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key, required this.rep});

  final Service rep;

  @override
  State<EquipmentPage> createState() => _StoreState();
}

class _StoreState extends State<EquipmentPage> {
  late final scrollProvider = Provider.of<ScrollProvider>(context);

  @override
  void initState() {
    Service.provider(context).getEquipmentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = (size.width / (size.width ~/ 350));
    int cardInRow = size.width ~/ cardWidth;
    int rows = widget.rep.equipment.length ~/ cardInRow;
    int addRow = rows % cardInRow != 0 ? 1 : 0;
    double constrainHeight = (rows + addRow) * (cardWidth / 2 * 3) + 50;
    print(" cardInRow $cardInRow  addRow $addRow constrain $constrainHeight card $cardWidth  rows $rows");
    return widget.rep.state == ServiceState.loading
        ? Center(child: CircularProgressIndicator())
        : widget.rep.state == ServiceState.failure
            ? ErrorCenter(
                onPressed: () {
                  Service.provider(context).getEquipmentList();
                },
                error: widget.rep.error!)
            : Stack(
                children: [
                  CustomScrollView(
                    controller: scrollProvider.controller,
                    slivers: [
                      SliverToBoxAdapter(
                          child: SizedBox(
                        height: max(
                            size.height -
                                AppDimensions.normalize(StaticUtils.footer),
                            constrainHeight),
                        child: Padding(
                          padding: Space.all(),
                          child: Padding(
                            padding: Space.navbarMobile!,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: max(1, size.width ~/ 350),
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              itemCount: widget.rep.equipment.length,
                              itemBuilder: (BuildContext context, int index) {
                                return EquipmentCard(
                                  equipment: widget.rep.equipment[index],
                                );
                              },
                            ),
                          ),
                        ),
                      )),
                      SliverToBoxAdapter(
                        child: AppFooter(),
                      ),
                    ],
                  ),
                  Appbar(
                    go: "/",
                    title: "Оборудование",
                  ),
                ],
              );
  }
}
