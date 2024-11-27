part of 'project.dart';

class User {
  final int id;
  final String first_name, last_name;

  User({
    required this.last_name,
    required this.id,
    required this.first_name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      first_name: json['first_name'] as String,
      id: json['id'] as int,
      last_name: json['last_name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
