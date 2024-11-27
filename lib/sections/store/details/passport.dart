part of "../project_page.dart";

class ProjectPassport extends StatelessWidget {
  const ProjectPassport({super.key, required this.details});

  final ProjectDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          BlockRow(data: [
            DataBlock(
              title: "Описание",
              text: details.passport?.description,
            ),
            VerticalDivider(),
            tagBloc("Теги", details.tags)
          ]),
          BlockRow(data: [
            DataBlock(title: "Цель", text: details.passport?.goal),
            VerticalDivider(),
            DataBlock(title: "Задачи", text: details.passport?.objectives),
          ]),
          BlockRow(data: [
            DataBlock(title: "Проблемы", text: details.passport?.problem),
            VerticalDivider(),
            DataBlock(title: "Новизна", text: details.passport?.novelty),
          ]),
          BlockRow(data: [
            DataBlock(
              title: "Текущие результаты",
              text: details.passport?.current_result,
            ),
            VerticalDivider(),
            DataBlock(
              title: "Ожидаемые результаты",
              text: details.passport?.expected_result,
            ),
          ]),
          BlockRow(data: [
            DataBlock(
              title: "Достижения",
              text: details.passport?.achievements,
            ),
            VerticalDivider(),
            DataBlock(title: "Ресурсы", text: details.passport?.resources),
          ]),
          endBlocRow(context, "Дополнительно", details.passport?.content)
        ],
      ),
    );
  }
}

class ProjectPassportMobile extends StatelessWidget {
  const ProjectPassportMobile({super.key, required this.details});

  final ProjectDetails details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          BlockRow(data: [
            DataBlock(
              title: "Описание",
              text: details.passport?.description,
            ),
          ]),
          BlockRow(data: [tagBloc("Теги", details.tags)]),
          BlockRow(data: [
            DataBlock(title: "Цель", text: details.passport?.goal),
          ]),
          BlockRow(data: [
            DataBlock(title: "Задачи", text: details.passport?.objectives),
          ]),
          BlockRow(data: [
            DataBlock(title: "Проблемы", text: details.passport?.problem),
          ]),
          BlockRow(data: [
            DataBlock(title: "Новизна", text: details.passport?.novelty),
          ]),
          BlockRow(data: [
            DataBlock(
              title: "Текущие результаты",
              text: details.passport?.current_result,
            ),
          ]),
          BlockRow(data: [
            DataBlock(
              title: "Ожидаемые результаты",
              text: details.passport?.expected_result,
            ),
          ]),
          BlockRow(data: [
            DataBlock(
              title: "Достижения",
              text: details.passport?.achievements,
            ),
          ]),
          BlockRow(data: [
            DataBlock(title: "Ресурсы", text: details.passport?.resources),
          ]),
          endBlocRow(context, "Дополнительно", details.passport?.content)
        ],
      ),
    );
  }
}

class BlockRow extends StatefulWidget {
  const BlockRow({super.key, required this.data});

  final List<Widget> data;

  @override
  State<BlockRow> createState() => _BlockRowState();
}

class _BlockRowState extends State<BlockRow> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: expand ? 500 : 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(50)),
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: widget.data,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
              onPressed: () {
                setState(() {
                  expand = !expand;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DataBlock extends StatefulWidget {
  const DataBlock({super.key, required this.title, this.text});

  final String title;
  final String? text;

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: Space.all(1),
        decoration: BoxDecoration(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: AppText.b2b),
            Space.y!,
            MarkdownBody(
              selectable: true,
              shrinkWrap: false,
              data: widget.text ?? '-',
            ),
          ],
        ),
      ),
    );
  }
}

Widget tagBloc(String title, List<Tag> tags) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(AppDimensions.normalize(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.b2b),
          Space.y!,
          Wrap(children: StaticUtils.projectCardTags(tags)),
        ],
      ),
    ),
  );
}

Widget endBlocRow(BuildContext context, String title, String? content) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(AppDimensions.normalize(12)),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(50)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.b2b),
        Space.y!,
        MarkdownBody(
          selectable: true,
          data: content ?? '-',
        ),
      ],
    ),
  );
}
