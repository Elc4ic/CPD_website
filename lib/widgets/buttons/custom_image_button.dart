part of 'custom_button.dart';

class CustomSvgButton extends StatefulWidget {
  const CustomSvgButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  final SvgPicture image;
  final GestureTapCallback? onTap;

  @override
  State<CustomSvgButton> createState() => _CustomSvgButtonState();
}

class _CustomSvgButtonState extends State<CustomSvgButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 60,
      child: InkWell(
        onTap: (widget.onTap),
        hoverColor: ColorConst.fog,
        child: Container(
          child: widget.image,
        ),
      ),
    );
  }
}

class CustomFilterButton extends StatefulWidget {
  const CustomFilterButton({super.key});

  @override
  State<CustomFilterButton> createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
          hoverColor: ColorConst.fog,
          icon: const Icon(Icons.filter_alt),
          onPressed: () => filterDialog(context),
        ),
      ),
    );
  }
}
