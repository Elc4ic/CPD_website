part of 'header.dart';

class desktopHeader extends StatelessWidget{
  const desktopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomSvgButton(
              image: SvgPicture.asset('black.svg'),
              onTap: () =>
                  {Navigator.pushNamed(context, StringConst.WELCOME_PAGE)},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Row(children: NavItem.navItemList(context)),
                const SizedBox(width: 40),
                CustomContainerButton(
                  radius: 5,
                  text: StringConst.LOGIN,
                  highlightStyle: Styles.whiteText18(context),
                  style: Styles.blueText18(context),
                  highlightColor: ColorConst.madison,
                  backcolor: Colors.white,
                  onTap: () =>
                      Navigator.pushNamed(context, StringConst.YANDEX_AUTH),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
