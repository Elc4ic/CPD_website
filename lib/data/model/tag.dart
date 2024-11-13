part of 'project.dart';

class Tag {
  final int id;
  final String name;
  final int projectId;

  Tag({
    required this.id,
    required this.projectId,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
      id: json['id'] as int,
      projectId: json['project_id'] as int,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project_id': instance.projectId,
    };
