part of 'project_details_page.dart';

class MobileProjectDetail extends StatefulWidget {
  const MobileProjectDetail({super.key, required this.id});

  final int id;

  @override
  State<MobileProjectDetail> createState() => _MobileProjectDetailState();
}

class _MobileProjectDetailState extends State<MobileProjectDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: mobileHeader(),
      ),
    );
  }
}
