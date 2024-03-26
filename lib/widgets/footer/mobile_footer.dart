part of 'footer.dart';

Widget mobileFooter(BuildContext context) {
  double widthNow = MediaQuery.of(context).size.width;
  return Container(
    color: ColorConst.fog,
    height: 200,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: widthNow / 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 65,
                    child: SvgPicture.asset('black.svg'),
                  ),
                  Text(StringConst.FOOTER, style: Styles.text14(context))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Контакты',
                    style: Styles.titleText24(context),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.mail),
                      ),
                      Text(
                        StringConst.CPD_MAIL,
                        style: Styles.text14(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.location_on),
                      ),
                      Text(
                        StringConst.ADDRES,
                        style: Styles.text14(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Expanded(child: Divider()),
        Text(
          '© ${StringConst.DVFU}',
          style: Styles.text14(context),
        ),
        const SizedBox(height: 4,)
      ],
    ),
  );
}
