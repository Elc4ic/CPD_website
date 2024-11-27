import 'package:cpdsite/widget/appbar.dart';
import 'package:cpdsite/widget/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:cpdsite/configs/app_dimensions.dart';
import 'package:cpdsite/configs/app_typography.dart';
import 'package:cpdsite/configs/space.dart';
import 'package:cpdsite/data/service/service.dart';
import 'package:cpdsite/sections/main/widgets/footer.dart';
import 'package:cpdsite/widget/custom_grid.dart';
import 'package:provider/provider.dart';

import '../../provider/scroll_provider.dart';

class Store extends StatefulWidget {
  const Store({super.key, required this.rep});

  final Service rep;

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  late final scrollProvider = Provider.of<ScrollProvider>(context);

  @override
  void initState() {
    Service.provider(context).getProjectList("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.rep.state == ServiceState.loading
        ? Center(child: CircularProgressIndicator())
        : widget.rep.state == ServiceState.failure
            ? ErrorCenter(
                onPressed: () {
                  Service.provider(context).getProjectList("");
                },
                error: widget.rep.error!)
            : Stack(
                children: [
                  CustomScrollView(
                    controller: scrollProvider.controller,
                    slivers: [
                      SliverPadding(
                        padding: Space.navbarMobile!,
                        sliver: SliverPadding(
                          padding: Space.all(2),
                          sliver: ProjectGrid(
                            width: MediaQuery.of(context).size.width,
                            cellWidth: 400,
                            items: widget.rep.projects,
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
                      SliverVisibility(
                          visible: widget.rep.projects.length < 5 &&
                              MediaQuery.of(context).size.width > 1050,
                          sliver: SliverToBoxAdapter(
                            child: Space.yf(5),
                          )),
                      SliverToBoxAdapter(
                        child: AppFooter(),
                      ),
                    ],
                  ),
                  Appbar(
                    go: "/",
                    title: "Проекты",
                  ),
                ],
              );
  }
}
