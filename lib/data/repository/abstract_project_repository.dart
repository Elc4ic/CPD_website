
import 'package:cpd_project_store/data/model/project.dart';

abstract class AbstractProjectRepository {
  Future<List<Project>> getProjectList();
  Future<Project> getProjectDetails(String currencyCode);
}