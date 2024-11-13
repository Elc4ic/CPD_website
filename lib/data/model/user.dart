part of 'project.dart';

class User {
  final int id;
  final String name, about, role;
  final int projectId;

  User({
    required this.about,
    required this.role,
    required this.projectId,
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      id: json['id'] as int,
      projectId: json['project_id'] as int,
      about: json['about'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project_id': instance.projectId,
      'about': instance..about,
      'role': instance.role,
    };
