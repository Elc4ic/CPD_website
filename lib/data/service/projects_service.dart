import 'package:cpdsite/data/service/service.dart';
import 'package:cpdsite/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/project.dart';

class ProjectService extends ChangeNotifier {
  ProjectService({
    required this.dio,
  });

  static ProjectService provider(BuildContext context, [bool listen = false]) =>
      Provider.of<ProjectService>(context, listen: listen);

  final Dio dio;

  late ProjectDetails _project;
  ServiceState _state = ServiceState.init;
  Object? _error;

  Future<void> getProject(int id) async {
    _state = ServiceState.loading;
    try {
      final response = await dio.get('${StaticUtils.projectApiUrl}/$id');
      final details = ProjectDetails.fromJson(response.data);
      _project = details;
      _state = ServiceState.success;
    } catch (e) {
      _error = e;
      _state = ServiceState.failure;
    } finally {
      notifyListeners();
    }
  }

  ProjectDetails get project => _project;
  ServiceState get state => _state;
  Object? get error => _error;
}
