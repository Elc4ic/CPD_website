import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/data/service/project_service.dart';
import 'package:folio/sections/equipment/equipment_card.dart';
import 'package:folio/sections/main/widgets/footer.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key, required this.rep});

  final Service rep;

  @override
  State<EquipmentPage> createState() => _StoreState();
}

class _StoreState extends State<EquipmentPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    Service.state(context).getEquipmentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.rep.isLoading
        ? Center(child: CircularProgressIndicator())
        : CustomScrollView(
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: Space.all(0.5, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Склад оборудования",
                  style: AppText.h3,
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: Space.h!,
          sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery
                .of(context)
                .size
                .width ~/ 550,
            childAspectRatio: 3 / 2,
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
        SliverVisibility(
            visible: widget.rep.projects.length < 5 &&
                MediaQuery
                    .of(context)
                    .size
                    .width > 1050,
            sliver: SliverToBoxAdapter(
              child: Space.yf(5),
            )),
        SliverToBoxAdapter(
          child: Footer(),
        ),
      ],
    );
  }
}