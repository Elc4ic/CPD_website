part of 'footer.dart';

Widget desktopFooter(BuildContext context) {
  double widthNow = MediaQuery.of(context).size.width;
  return Container(
    color: ColorConst.fog,
    height: 230,
    child: Column(
      children: [
        SizedBox(height: widthNow / 80),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                  Text(StringConst.FOOTER,style: Styles.text14(context),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Рассылка',
                    style: Styles.titleText24(context),
                  ),
                  Text(
                    StringConst.WANT_JOIN,
                    style: Styles.text14(context),
                  ),
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
        Expanded(child: Divider()),
        Text(
          '© ${StringConst.DVFU}',
          style: Styles.text14(context),
        ),
        const SizedBox(height: 4,)
      ],
    ),
  );
}
