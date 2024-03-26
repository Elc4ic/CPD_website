import 'package:flutter/material.dart';

import '../values/values.dart';

class HoverRow extends StatefulWidget {
  const HoverRow({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap,
    required this.shag,
    required this.title,
    required this.text,
  });

  final String shag;
  final String title;
  final String text;
  final Color color;
  final IconData icon;
  final GestureTapCallback? onTap;

  @override
  State<HoverRow> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<HoverRow> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double widthNow = Utils.widthNow(context);
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      hoverColor: ColorConst.fog,
      onTap: widget.onTap,
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConst.madison),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Icon(
                    widget.icon,
                    color: isHover ? ColorConst.violet : ColorConst.madison,
                  )),
                ),
              ),
            ),
            SizedBox(
              width: widthNow>Const.PhoneWidth ? widthNow / 3: widthNow/1.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shag,
                    style: Styles.blueText18(context),
                  ),
                  Text(
                    widget.title,
                    style: Styles.titleText24(context),
                  ),
                  Text(widget.text, style: Styles.text14(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
