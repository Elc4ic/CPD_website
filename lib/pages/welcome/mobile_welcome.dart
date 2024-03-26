part of 'welcome.dart';

class MobileWelcome extends StatelessWidget {
  const MobileWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    double widthNow = Utils.widthNow(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: mobileHeader(),
      ),
      endDrawer: const mobileDrawer(),
      body: SelectionArea(
        child: ListView(
          children: [
            Container(
              color: ColorConst.fog,
              child: Padding(
                padding: EdgeInsets.all(widthNow / 30),
                child: Column(
                  children: [
                    ///first widget
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    StringConst.C,
                                    style: Styles.titleText60(context),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  StringConst.P,
                                  style: Styles.titleText60(context),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  StringConst.D,
                                  style: Styles.titleText60(context),
                                ),
                              ],
                            ),
                            Utils.devideHeight60(widthNow),
                            Text(
                              StringConst.GET_PROJECT_TEXT,
                              semanticsLabel: StringConst.GET_PROJECT_TEXT,
                              style: Styles.text14(context),
                            ),
                            Utils.devideHeight15(widthNow),
                            SizedBox(
                              width: 230,
                              child: CustomContainerButton(
                                text: StringConst.GET_PROJECT,
                                highlightStyle: Styles.blueText18(context),
                                style: Styles.whiteText18(context),
                                highlightColor: Colors.white,
                                backcolor: ColorConst.madison,
                                radius: 5,
                                onTap: () => {},
                              ),
                            ),
                            SizedBox(height: widthNow / 15),
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: NavItem.tagList(context),
                            )
                          ],
                        ),
                      ),
                    ),
                    Utils.devideHeight30(widthNow),
                    SizedBox(
                      width: widthNow,
                      child: Image.asset('hero.png'),
                    ),
                    Utils.devideHeight30(widthNow),
                  ],
                ),
              ),
            ),

            ///2
            Padding(
              padding: EdgeInsets.all(widthNow / 30),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(StringConst.JOIN_TO_CPD,
                            style: Styles.blueText18(context)),
                        Text(StringConst.START_TO_CPD,
                            style: Styles.titleText24(context)),
                        Text(StringConst.STEPS_TO_CPD,
                            style: Styles.text14(context)),
                      ],
                    ),
                  ),
                  Utils.devideHeight60(widthNow),
                  Column(
                    children: [
                      Utils.devideHeight60(widthNow),
                      HoverRow(
                        shag: StringConst.STEP1,
                        title: StringConst.STEP1_TITLE,
                        text: StringConst.STEP1_TEXT,
                        onTap: () {},
                        color: ColorConst.madison,
                        icon: Icons.cabin,
                      ),
                      Utils.devideHeight60(widthNow),
                      HoverRow(
                        shag: StringConst.STEP2,
                        title: StringConst.STEP2_TITLE,
                        text: StringConst.STEP2_TEXT,
                        onTap: () {},
                        color: ColorConst.madison,
                        icon: Icons.cabin,
                      ),
                      Utils.devideHeight60(widthNow),
                      HoverRow(
                        shag: StringConst.STEP3,
                        title: StringConst.STEP3_TITLE,
                        text: StringConst.STEP3_TEXT,
                        onTap: () {},
                        color: ColorConst.madison,
                        icon: Icons.cabin,
                      ),
                      Utils.devideHeight60(widthNow),
                      HoverRow(
                        shag: StringConst.STEP4,
                        title: StringConst.STEP4_TITLE,
                        text: StringConst.STEP4_TEXT,
                        onTap: () {},
                        color: ColorConst.madison,
                        icon: Icons.cabin,
                      ),
                      Utils.devideHeight60(widthNow),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      child: Image.asset('map.jpg'),
                    ),
                  ),

                  ///third widget
                  Utils.devideHeight30(widthNow),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConst.PROJECT_SPACE,
                            style: Styles.titleText24(context)),
                        SizedBox(height: widthNow / 30),
                        Text(StringConst.PROJECT_SPACE_TEXT,
                            style: Styles.text14(context)),
                      ],
                    ),
                  ),
                  Utils.devideHeight30(widthNow),
                  SizedBox(
                    child: Image.asset('office.jpg'),
                  ),
                  Utils.devideHeight30(widthNow),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConst.WORKSHOP,
                            style: Styles.titleText24(context)),
                        SizedBox(height: widthNow / 30),
                        Text(StringConst.WORKSHOP_TEXT,
                            style: Styles.text14(context)),
                      ],
                    ),
                  ),
                  Utils.devideHeight30(widthNow),
                  SizedBox(
                    child: Image.asset('master.jpg'),
                  ),
                ],
              ),
            ),

            Utils.devideHeight30(widthNow),

            ///forth widget
            Container(
              color: ColorConst.madison,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('service.png'),
                    Utils.devideHeight30(widthNow),
                    Text(
                      StringConst.SIGN_NOW,
                      style: Styles.titleWhiteText24(context),
                    ),
                    Utils.devideHeight30(widthNow),
                    Text(
                      StringConst.SIGN_TEXT,
                      style: Styles.whiteText18(context),
                    ),
                  ],
                ),
              ),
            ),
            mobileFooter(context),
          ],
        ),
      ),
    );
  }
}
