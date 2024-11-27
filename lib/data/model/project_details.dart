part of 'project.dart';

class ProjectDetails {
  final int id, status;
  final String name, created, updated;
  final User? owner;
  final String? consumer;
  final String? img;

  final Passport? passport;
  final List<Tag> tags;
  final List<User> users;
  final List<ImageEntity> images;

  ProjectDetails({
    required this.id,
    required this.status,
    this.consumer,
    required this.name,
    required this.owner,
    this.img,
    required this.created,
    required this.updated,
    required this.users,
    required this.tags,
    required this.images,
    this.passport,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailsToJson(this);
}

ProjectDetails _$ProjectDetailsFromJson(Map<String, dynamic> json) =>
    ProjectDetails(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as int,
      owner:
          json['owner'] == null ? null : User.fromJson(json['owner']) as User?,
      img: json['img'] as String?,
      passport: json['passport'] == null ? null : Passport.fromJson(json['passport']) as Passport?,
      created: json['created'] as String,
      updated: json['updated'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDetailsToJson(ProjectDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'owner': instance.owner,
      'passport': instance.passport,
      'created': instance.created,
      'updated': instance.updated,
    };
