part of 'project_list_bloc.dart';

@immutable
abstract class ProjectListState {}

class ProjectListInitial extends ProjectListState {}

class ProjectListLoading extends ProjectListState {}

class ProjectListLoaded extends ProjectListState {
  ProjectListLoaded({
    required this.projectList,
  });

  final List<Project> projectList;
}

class ProjectListLoadingFailure extends ProjectListState {
  ProjectListLoadingFailure({
    this.exception,
  });

  final Object? exception;
}
