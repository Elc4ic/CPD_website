part of 'welcome.dart';

class DesktopWelcome extends StatefulWidget {
  const DesktopWelcome({super.key});

  @override
  State<DesktopWelcome> createState() => _DesktopWelcomeState();
}

class _DesktopWelcomeState extends State<DesktopWelcome> {
  @override
  Widget build(BuildContext context) {
    double widthNow = Utils.widthNow(context);
    return Scaffold(
      body: SelectionArea(
        child: ListView(
          children: [
            //header
            const desktopHeader(),

            ///first widget
            Utils.devideHeight120(widthNow),
            CenterContainer(
              color: ColorConst.fog,
              widthNow: widthNow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: widthNow > 1200 ? widthNow / 2.4 : 500,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthNow / 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          Utils.devideHeight60(widthNow),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomContainerButton(
                                text: StringConst.GET_PROJECT,
                                highlightStyle: Styles.blueText18(context),
                                style: Styles.whiteText18(context),
                                highlightColor: Colors.white,
                                backcolor: ColorConst.madison,
                                radius: 5,
                                onTap: () => {launchUrl(Uri.parse(StringConst.CPD_SIGN_IN_FORM))},
                              ),
                            ],
                          ),
                          Utils.devideHeight60(widthNow),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: NavItem.tagList(context),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Image.asset('hero.png'),
                  ),
                ],
              ),
            ),
            Utils.devideHeight30(widthNow),

            ///second widget
            Center(
              child: Column(
                children: [
                  Text(StringConst.JOIN_TO_CPD,
                      style: Styles.blueText18(context)),
                  Text(StringConst.START_TO_CPD,
                      style: Styles.titleText24(context)),
                  Text(StringConst.STEPS_TO_CPD, style: Styles.text14(context)),
                ],
              ),
            ),
            Utils.devideHeight30(widthNow),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: widthNow / 2.7,
                    child: Image.asset('map.jpg'),
                  ),
                ),
                Utils.devideWidth15(widthNow),
                Column(
                  children: [
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
                  ],
                ),
              ],
            ),

            ///third widget
            Utils.devideHeight30(widthNow),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: widthNow / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConst.PROJECT_SPACE,
                          style: Styles.titleText24(context)),
                      const SizedBox(height: 8.0),
                      Text(StringConst.PROJECT_SPACE_TEXT,
                          style: Styles.text14(context)),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthNow / 3,
                  child: Image.asset('office.jpg'),
                ),
              ],
            ),
            Utils.devideHeight30(widthNow),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthNow / 3,
                  child: Image.asset('master.jpg'),
                ),
                SizedBox(
                  width: widthNow / 2.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConst.WORKSHOP,
                          style: Styles.titleText24(context)),
                      const SizedBox(height: 8.0),
                      Text(StringConst.WORKSHOP_TEXT,
                          style: Styles.text14(context)),
                    ],
                  ),
                ),
              ],
            ),

            ///forth widget
            Utils.devideHeight30(widthNow),
            CenterContainer(
              color: ColorConst.madison,
              widthNow: widthNow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: widthNow / 2.7,
                      child: Image.asset('service.png'),
                    ),
                  ),
                  Utils.devideWidth30(widthNow),
                  SizedBox(
                    width: widthNow / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(StringConst.SIGN_NOW,
                            style: Styles.titleWhiteText24(context)),
                        const SizedBox(height: 8),
                        Text(StringConst.SIGN_TEXT,
                            style: Styles.whiteText18(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widthNow > 1300) Utils.devideHeight30(widthNow),
            desktopFooter(context),
          ],
        ),
      ),
    );
  }
}
