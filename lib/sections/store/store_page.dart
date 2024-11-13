import 'package:flutter/material.dart';
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/configs/app_typography.dart';
import 'package:folio/configs/space.dart';
import 'package:folio/data/service/project_service.dart';
import 'package:folio/sections/main/widgets/footer.dart';
import 'package:folio/widget/custom_grid.dart';

class Store extends StatefulWidget {
  const Store({super.key, required this.rep});

  final Service rep;

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    Service.state(context).getProjectList("");
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
                  margin: EdgeInsets.only(top: AppDimensions.normalize(20)),
                  padding: Space.all(0.5, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Витрина проектов",
                        style: AppText.h3,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: widget.rep.projects.isEmpty,
                  child: Center(
                    child: Text(
                      "Search: not found",
                      style: AppText.b1,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: Space.h!,
                sliver: ProjectGrid(
                  width: MediaQuery.of(context).size.width,
                  cellWidth: 350,
                  items: widget.rep.projects,
                ),
              ),
              SliverVisibility(
                  visible: widget.rep.projects.length < 5 &&
                      MediaQuery.of(context).size.width > 1050,
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
