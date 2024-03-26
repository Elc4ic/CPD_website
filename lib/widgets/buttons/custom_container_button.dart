part of 'custom_button.dart';

class CustomContainerButton extends StatefulWidget {
  const CustomContainerButton({
    super.key,
    required this.text,
    required this.highlightStyle,
    required this.highlightColor,
    required this.backcolor,
    required this.onTap,
    required this.radius,
    required this.style,
  });

  final String text;
  final TextStyle highlightStyle;
  final TextStyle style;
  final Color highlightColor;
  final Color backcolor;
  final double radius;
  final GestureTapCallback? onTap;

  @override
  State<CustomContainerButton> createState() => _CustomContainerButtonState();
}

class _CustomContainerButtonState extends State<CustomContainerButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHover ? widget.highlightColor : widget.backcolor,
          border: Border.all(
              color: isHover ? widget.backcolor : widget.highlightColor),
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Center(
            child: Text(
              widget.text,
              style:
                  isHover ?  widget.highlightStyle : widget.style,
            ),
          ),
        ),
      ),
    );
  }
}
