part of '../project_page.dart';

Widget projectTeam(BuildContext context, ProjectDetails details) {
  return Container(
    width: double.infinity,
    padding: Space.all(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Space.y!,
        Text("Руководитель", style: AppText.b1b),
        Space.y!,
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TeamCard(user: details.owner ?? details.users.first),
        ),
        Space.y!,
        Text(
          "Команда",
          style: AppText.b1b,
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
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 120,
          width: 240,
          padding: Space.all(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.cyan,
              ),
              Space.y!,
              Text(
                "${widget.user.last_name} ${widget.user.first_name}",
                style: AppText.b2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
