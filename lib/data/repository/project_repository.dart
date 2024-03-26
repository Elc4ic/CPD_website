import '../model/project.dart';
import 'abstract_project_repository.dart';

class ProjectRepository implements AbstractProjectRepository {
  @override
  Future<List<Project>> getProjectList() async {
    var catList = <Project>[];
    catList = await _fetchProjectListFromApi();

    catList.sort((a, b) => b.id.compareTo(a.id));
    return catList;
  }

  Future<List<Project>> _fetchProjectListFromApi() async {
    List<Project> projectList = List.empty(growable: true);
    for (int i = 1; i < 31; i++) {
      projectList.add(Project(
          id: i,
          name: 'Test_project',
          status: 1,
          vacancies: 5,
          places: 10,
          start: 10,
          end: 20,
          endForJoin: 5));
    }
    return projectList;
  }

  @override
  Future<Project> getProjectDetails(String currencyCode) async {
    final coin = await _fetchProjectCrimeFromApi(currencyCode);
    return coin;
  }

  Future<Project> _fetchProjectCrimeFromApi(String currencyCode) async {
    return Project(
        id: 1,
        name: 'Test_project',
        status: 1,
        vacancies: 5,
        places: 10,
        start: 10,
        end: 20,
        endForJoin: 5);
  }
}
