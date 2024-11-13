import 'package:folio/generated/assets.dart';

part 'equipment.dart';

part 'project_details.dart';

part 'tag.dart';

part 'user.dart';

part 'image.dart';

class Project {
  final int id;
  final String name ;
  final String? img, owner,status;
  final DateTime? created, updated;
  final List<Tag> tags;

  Project({
    required this.id,
    required this.name,
    this.owner,
    this.img,
    this.status,
    required this.tags,
    this.created,
    this.updated,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int,
      name: ((json['name'] as String).length > 100)
          ? "${(json['name'] as String).substring(0, 98)}..."
          : (json['name'] as String),
      status: json['status'] as String?,
      owner: json['owner'] as String?,
      img: json['img'] == null ? Assets.cpd91451 : json['img'] as String?,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'owner': instance.owner,
      'created': instance.created,
      'updated': instance.updated,
      'tags': instance.tags,
    };
