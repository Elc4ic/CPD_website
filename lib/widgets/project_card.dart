import 'package:cpd_project_store/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/project.dart';

class ProjCard extends StatefulWidget {
  const ProjCard({super.key, required this.details});

  final Project details;

  @override
  State<ProjCard> createState() => _ProjCardState();
}

class _ProjCardState extends State<ProjCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  ColorConst.fog,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: ColorConst.madison, width: isHover ? 3.0 : 1.0),
      ),
      elevation: 2,
      shadowColor: Colors.black,
      child: InkWell(
        onTap: () =>
            {Navigator.pushNamed(context, '/project/${widget.details.id}')},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Column(
          children: [
            ListTile(
              title: Text('№${widget.details.id} ${widget.details.name}'),
            ),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://sun1-30.userapi.com/s/v1/ig2/vtjyzEdzXZ0_dbD-t56DtQCnteVXMoIuaYK3yTOyR-uGpUl_icCr7XUqt4dUetxPI23ftHFuJ0tczPmnqRlBFblC.jpg?size=400x400&quality=96&crop=66,66,524,524&ava=1'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(7.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Количество вакансий: ${widget.details.vacancies}'),
                  Text('Количество мест: ${widget.details.places}'),
                  Text('Срок: ${widget.details.start} - ${widget.details.end}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}