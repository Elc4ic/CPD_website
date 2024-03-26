import 'package:cpd_project_store/values/values.dart';
import 'package:cpd_project_store/widgets/buttons/custom_button.dart';
import 'package:cpd_project_store/widgets/custom_text_field.dart';
import 'package:cpd_project_store/widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/repository/abstract_project_repository.dart';
import '../../widgets/custom_grid_view.dart';
import '../../widgets/header/header.dart';
import 'bloc/project_list_bloc.dart';

part 'dialog_view.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final _projectListBloc = ProjectListBloc(
    GetIt.I<AbstractProjectRepository>(),
  );

  @override
  void initState() {
    _projectListBloc.add(LoadProjectList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthNow = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: ResponsiveLayout(
          mobileWidget: mobileHeader(),
          desktopWidget: desktopHeader(),
        ),
      ),
      endDrawer: const mobileDrawer(),
      body: SelectionArea(
        child: BlocBuilder<ProjectListBloc, ProjectListState>(
          bloc: _projectListBloc,
          builder: (context, state) {
            if (state is ProjectListLoaded) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        Center(
                          heightFactor: 2,
                          child: Text(
                            'Библиотека проектов',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomFilterButton(),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ProjectGrid(
                      width: widthNow,
                      items: state.projectList,
                    ),
                  ),
                ],
              );
            }
            if (state is ProjectListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Something went wrong'),
                    const Text('Please try againg later'),
                    SizedBox(height: widthNow / 30),
                    TextButton(
                      onPressed: () {
                        _projectListBloc.add(LoadProjectList());
                      },
                      child: const Text('Try againg'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
