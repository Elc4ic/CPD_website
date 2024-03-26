class Project {
  final int id;
  final String name;
  final int status;
  final int vacancies;
  final int places;
  final int /*DateTime*/ start;
  final int end;
  final int endForJoin;

  //details
  final String? introduction;
  final String? target;
  final String? tasks;
  final String? uniqueness;
  final String? product;
  final String? supervisor;
  final String? depart;

  Project(
      {required this.id,
      required this.name,
      required this.status,
      required this.vacancies,
      required this.places,
      required this.start,
      required this.end,
      required this.endForJoin,
      this.introduction,
      this.target,
      this.tasks,
      this.uniqueness,
      this.product,
      this.supervisor,
      this.depart
      });
}
