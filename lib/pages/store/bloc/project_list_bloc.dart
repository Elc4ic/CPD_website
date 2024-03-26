import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/project.dart';
import '../../../data/repository/abstract_project_repository.dart';

part 'project_list_event.dart';
part 'project_list_state.dart';

class ProjectListBloc extends Bloc<ProjectListEvent, ProjectListState> {
  ProjectListBloc(this.projectRepository) : super(ProjectListInitial()) {
    on<LoadProjectList>(_load);
  }

  final AbstractProjectRepository projectRepository;

  Future<void> _load(
      LoadProjectList event,
      Emitter<ProjectListState> emit,
      ) async {
    try {
      if (state is! ProjectListLoaded) {
        emit(ProjectListLoading());
      }
      final projectList = await projectRepository.getProjectList();
      emit(ProjectListLoaded(projectList: projectList));
    } catch (e) {
      emit(ProjectListLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}

