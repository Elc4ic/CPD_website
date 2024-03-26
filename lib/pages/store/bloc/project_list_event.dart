part of 'project_list_bloc.dart';

@immutable
abstract class ProjectListEvent {}

class LoadProjectList extends ProjectListEvent {
  LoadProjectList({
    this.completer,
  });

  final Completer? completer;
}
