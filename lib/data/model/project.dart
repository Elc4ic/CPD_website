import 'package:cpdsite/data/model/passport.dart';
import 'package:cpdsite/generated/assets.dart';

part 'equipment.dart';

part 'project_details.dart';

part 'tag.dart';

part 'user.dart';

part 'image.dart';

class Project {
  final int id, status;
  final String name;

  final String? img, customer;
  final User? owner;
  final DateTime? created, updated;
  final List<Tag> tags;

  Project({
    required this.id,
    required this.name,
    this.owner,
    this.img,
    this.customer,
    required this.status,
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
      status: json['status'] as int,
      customer: json['customer'] as String?,
      owner:
          json['owner'] == null ? null : User.fromJson(json['owner']) as User?,
      img: json['img'] as String?,
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
