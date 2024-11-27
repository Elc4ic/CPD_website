part of "../project_page.dart";

class ProjectGallery extends StatelessWidget {
  ProjectGallery({super.key, required this.details});

  final ProjectDetails details;

  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    List<Widget> images = imageList(details.images);
    Size size = MediaQuery.of(context).size;
    double cardWidth = ((size.width) / (size.width ~/ 200));
    double constrainHeight =
        (images.length ~/ (size.width ~/ cardWidth) + 1) * (cardWidth / 16 * 9);
    return Column(
      children: [
        Container(
          padding: Space.all(),
          width: size.width * 0.9,
          height: constrainHeight,
          child: ImageGrid(
            width: size.width,
            cellWidth: 200,
            items: images,
            controller: controller,
            size: size,
          ),
        ),
      ],
    );
  }
}

Future<void> imageDialog(
    BuildContext context,
    CarouselSliderController controller,
    int image,
    List<Widget> images,
    Size size) async {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: Space.all(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Container(
              width: size.width * 0.8,
              height: size.width * 0.8 / 16 * 9,
              child: CarouselSlider(
                carouselController: controller,
                items: images,
                options: CarouselOptions(
                  initialPage: 0,
                  height: size.width * 0.7 / 16 * 9,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
                icon: Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    ),
  );
}

List<Widget> imageList(List<ImageEntity> arr) {
  return List.generate(
    arr.length,
    (index) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 500,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.network("${StaticUtils.apiUrl}${arr[index].url}"),
        ),
      ),
    ),
  );
}
