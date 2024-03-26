part of 'header.dart';

class mobileHeader extends StatelessWidget{
  const mobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSvgButton(
            image: SvgPicture.asset('black.svg'),
            onTap: () =>
                {Navigator.pushNamed(context, StringConst.WELCOME_PAGE)},
          ),
          CustomContainerButton(
            radius: 5,
            text: StringConst.LOGIN,
            highlightStyle: Styles.whiteText18(context),
            style: Styles.blueText18(context),
            highlightColor: ColorConst.madison,
            backcolor: Colors.white,
            onTap: () => Navigator.pushNamed(context, StringConst.YANDEX_AUTH),
          ),
        ],
      ),
    );
  }

}
