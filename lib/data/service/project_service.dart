import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';

class Service extends ChangeNotifier {
  Service({
    required this.dio,
  });

  static Service state(BuildContext context, [bool listen = false]) =>
      Provider.of<Service>(context, listen: listen);

  final Dio dio;
  final String projectApiUrl = 'https://cpd.dvfu.ru/api/site/projects/';
  final String equipmentApiUrl = 'https://cpd.dvfu.ru/api/site/equipments/';

  List<Project> _projects = [];
  List<Equipment> _equipment = [];
  late ProjectDetails _project;
  bool _isLoading = false;

  Future<void> getProjectList(String search) async {
    _isLoading = true;
    final response = await dio.get(projectApiUrl);
    final data = response.data as List<dynamic>;
    final List<Project> projectList = data.map((e) {
      return Project.fromJson(e);
    }).toList();
    _projects = projectList.where((a) => a.name.contains(search)).toList();
    _isLoading = false;
    notifyListeners();
  }

  @override
  Future<void> getProject(int id) async {
    _isLoading = true;
    final response = await dio.get('$projectApiUrl$id');
    final details = ProjectDetails.fromJson(response.data);
    _project = details;
    _isLoading = false;
    notifyListeners();
  }

  List<Project> get projects => _projects;

  List<Equipment> get equipment => _equipment;

  ProjectDetails get project => _project;

  bool get isLoading => _isLoading;

  Future<void> getEquipmentList() async {
    _isLoading = true;
    List<Equipment> equipment = [];

    final response = await dio.get(equipmentApiUrl);
    final data = response.data as List<dynamic>;
    equipment = data.map((e) {
      return Equipment.fromJson(e);
    }).toList();

    _equipment = equipment;
    _isLoading = false;
    notifyListeners();
  }
}
