part of 'values.dart';

class NavItem {
  static List<Widget> navItemList(BuildContext context) {
    List<NavigationItem> arr = List.empty(growable: true);
    arr.add(NavigationItem(StringConst.HOME, StringConst.WELCOME_PAGE));
    arr.add(NavigationItem(StringConst.STORE, StringConst.STORE_PAGE));
    arr.add(NavigationItem(StringConst.UNIVER, StringConst.DVFU_MAIN_PAGE));

    return List.generate(
      arr.length,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        child: CustomTextButton(
          text: arr[index].name,
          style: Styles.text14(context),
          hoverColor: ColorConst.fog,
          onTap: () {
            if (arr[index].name == StringConst.UNIVER) {
              launchUrl(Uri.parse(StringConst.DVFU_MAIN_PAGE));
            }  else{
              Navigator.pushNamed(context, arr[index].route);
            }

          },
        ),
      ),
    );
  }

  static List<Widget> tagList(BuildContext context) {
    List<NavigationItem> tags = List.empty(growable: true);
    tags.add(NavigationItem(StringConst.DETART_INTERNET, StringConst.WELCOME_PAGE));
    tags.add(NavigationItem(StringConst.DETART_COSMOS, StringConst.STORE_PAGE));
    tags.add(NavigationItem(StringConst.DETART_PODVODKA, StringConst.DVFU_MAIN_PAGE));
    tags.add(NavigationItem(StringConst.DETART_ROBOT, StringConst.DVFU_MAIN_PAGE));

    return List.generate(
      tags.length,
          (index) => Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: CustomContainerButton(
            text: '#${tags[index].name}',
            highlightStyle: Styles.whiteText14(context),
            style: Styles.whiteText14(context),
            highlightColor: Colors.blueAccent,
            onTap: () {},
            backcolor: ColorConst.madison,
            radius: 20,
          ),
        ),
      ]),
    );
  }

}

class NavigationItem {
  final String name;
  final String route;

  NavigationItem(this.name, this.route);
}
