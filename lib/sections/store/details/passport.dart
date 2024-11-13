part of "../project_page.dart";

Widget projectPassport(BuildContext context, ProjectDetails details) {
  return Container(
    color: Colors.black12,
    child: Column(
      children: [
        passportRow("Задача", "Результат", details),
        passportRow("Исследование", "Результат", details),
      ],
    ),
  );
}

List<String> blocks = [];

Widget passportRow(String title1, String title2, ProjectDetails details) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(width: 1, color: Colors.grey),
      ),
    ),
    margin: Space.h,
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(AppDimensions.normalize(16)),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title1, style: AppText.b2b),
                Space.y!,
                MarkdownBody(
                  selectable: true,
                  data: details.content ?? 'Markdown here😀',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.normalize(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title2, style: AppText.b2b),
                Space.y!,
                MarkdownBody(
                  data: details.content ?? 'Markdown here😀',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
