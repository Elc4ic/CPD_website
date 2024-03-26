import 'package:cpd_project_store/widgets/header/header.dart';
import 'package:flutter/material.dart';

import '../../widgets/responsive/responsive_layout.dart';

part 'desktop_project_details_page.dart';
part 'mobile_project_details_page.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key, required this.id});

  final int id;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileWidget: MobileProjectDetail(id: widget.id), desktopWidget: DesktopProjectDetail(id: widget.id));
  }
}
