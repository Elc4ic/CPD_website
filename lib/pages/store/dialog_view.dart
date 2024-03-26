part of 'store_page.dart';

Future<void> filterDialog(BuildContext context) async {
  double widthNow = Utils.widthNow(context);
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: ColorConst.fog,
      child: Container(
        width: widthNow > 600 ? 600 : widthNow,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConst.FILTER_SEARCH,
                    style: Styles.titleText24(context),
                  ),
                  Icon(Icons.filter_alt),
                ],
              ),
              Utils.devideHeight60(widthNow),
              CustomTextField(),
              Utils.devideHeight60(widthNow),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    text: StringConst.FILTER_RESET,
                    style: Styles.text14(context),
                    hoverColor: ColorConst.fog,
                    onTap: () {},
                  ),
                  CustomContainerButton(
                    text: StringConst.FILTER_APPLY,
                    style: Styles.text14(context),
                    onTap: () {},
                    radius: 20,
                    highlightStyle: Styles.text14(context),
                    highlightColor: ColorConst.royalBlue,
                    backcolor: ColorConst.violet,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
