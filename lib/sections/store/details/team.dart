part of '../project_page.dart';

Widget projectTeam(BuildContext context, ProjectDetails details) {
  return Padding(
    padding: Space.h2!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space.y!,
        Text("Руководитель", style: AppText.h3b),
        Space.y!,
        TeamCard(
            user: User(
                about: "Руководит",
                role: "Руководитель",
                id: 40,
                name: details.owner,
                projectId: 40)),
        Space.y!,
        Text(
          "Команда",
          style: AppText.h3b,
        ),
        Space.y!,
        Wrap(
          spacing: 5,
          runSpacing: 10,
          children: teamList(context, details.users),
        ),
      ],
    ),
  );
}

List<Widget> teamList(BuildContext context, List<User> arr) {
  return List.generate(
    arr.length,
    (index) => TeamCard(user: arr[index]),
  );
}

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.user});

  final User user;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 250,
        width: 250,
        padding: Space.all(),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.cyan),
            ),
            Space.y!,
            Text(
              widget.user.name,
              style: AppText.b2,
            ),
            Space.y!,
            Text(
              widget.user.role,
              style: AppText.b2?.copyWith(color: Colors.black54),
            ),
            Space.y!,
            Text(
              widget.user.about,
              style: AppText.b2,
            ),
          ],
        ),
      ),
    );
  }
}
