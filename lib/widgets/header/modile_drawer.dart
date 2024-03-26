part of 'header.dart';

class mobileDrawer extends StatelessWidget {
  const mobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: NavItem.navItemList(context),
        ),
      ),
    );
  }
}
