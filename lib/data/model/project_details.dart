part of 'project.dart';

class ProjectDetails {
  final int id;
  final String name, annotation, owner, created, updated;
  final String? content;
  final String? img;

  final List<Tag> tags;
  final List<User> users;
  final List<ImageEntity> image;

  ProjectDetails({
    required this.image,
    required this.id,
    required this.name,
    required this.annotation,
    required this.owner,
    this.content,
    this.img,
    required this.tags,
    required this.users,
    required this.created,
    required this.updated,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailsToJson(this);
}

ProjectDetails _$ProjectDetailsFromJson(Map<String, dynamic> json) =>
    ProjectDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      annotation: json['annotation'] as String,
      owner: json['owner'] as String,
      img: json['img'] == null ? Assets.cpd91451 : json['img'] as String?,
      content: json['content'] as String?,
      created: json['created'] as String,
      updated: json['updated'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: (json['images'] as List<dynamic>)
          .map((e) => ImageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDetailsToJson(ProjectDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'annotation': instance.annotation,
      'owner': instance.owner,
      'content': instance.content,
      'created': instance.created,
      'updated': instance.updated,
    };
