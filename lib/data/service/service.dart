import 'package:cpdsite/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';

enum ServiceState { init, loading, success, failure }

class Service extends ChangeNotifier {
  Service({
    required this.dio,
  });

  static Service provider(BuildContext context, [bool listen = false]) =>
      Provider.of<Service>(context, listen: listen);

  final Dio dio;

  List<Project> _projects = [];
  List<Equipment> _equipment = [];
  ServiceState _state = ServiceState.init;
  Object? _error;

  Future<void> getProjectList(String search) async {
    if (_projects.isEmpty) {
      _state = ServiceState.loading;
      try {
        final response = await dio.get(StaticUtils.projectApiUrl);
        final data = response.data as List<dynamic>;
        final List<Project> projectList = data.map((e) {
          return Project.fromJson(e);
        }).toList();
        _projects = projectList.where((a) => a.name.contains(search)).toList();
        _state = ServiceState.success;
      } catch (e) {
        _error = e;
        _state = ServiceState.failure;
      } finally {
        notifyListeners();
      }
    }
  }

  Future<void> getEquipmentList() async {
    if (_equipment.isEmpty) {
      _state = ServiceState.loading;
      try {
        final response = await dio.get(StaticUtils.equipmentApiUrl);
        final data = response.data as List<dynamic>;
        List<Equipment> equipment = data.map((e) {
          return Equipment.fromJson(e);
        }).toList();
        _equipment = equipment;
        _state = ServiceState.success;
      } catch (e) {
        _error = e;
        _state = ServiceState.failure;
      } finally {
        notifyListeners();
      }
    }
  }

  List<Project> get projects => _projects;

  List<Equipment> get equipment => _equipment;

  ServiceState get state => _state;

  Object? get error => _error;
}
