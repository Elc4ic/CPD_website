
part of "../project_page.dart";

Widget projectGallery(BuildContext context, ProjectDetails details) {
  return CarouselSlider(
    items: imageList(context, details.image),
    options: CarouselOptions(
      height: 400,
      aspectRatio: 16 / 9,
      enableInfiniteScroll: true,
    ),
  );
}

List<Widget> imageList(BuildContext context, List<ImageEntity> arr) {
  return List.generate(
    arr.length,
        (index) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 1000,
        width: 1000,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.network(arr[index].url),
        ),
      ),
    ),
  );
}
