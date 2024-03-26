part of 'custom_button.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({super.key,
    required this.text,
    required this.style,
    required this.hoverColor,
    required this.onTap});

  final String text;
  final TextStyle style;
  final Color hoverColor;
  final GestureTapCallback? onTap;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      hoverColor: widget.hoverColor,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.text,
          style: widget.style
        ),
      ),
    );
  }
}
