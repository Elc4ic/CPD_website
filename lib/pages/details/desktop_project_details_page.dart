part of 'project_details_page.dart';

class DesktopProjectDetail extends StatefulWidget {
  const DesktopProjectDetail({super.key, required this.id});

  final int id;

  @override
  State<DesktopProjectDetail> createState() => _DesktopProjectDetailState();
}

class _DesktopProjectDetailState extends State<DesktopProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: desktopHeader(),
      ),
    );
  }
}
