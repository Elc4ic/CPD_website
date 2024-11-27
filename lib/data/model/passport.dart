import 'package:cpdsite/generated/assets.dart';

class Passport {
  final int id;
  final String? status,
      description,
      goal,
      objectives,
      expected_result,
      current_result,
      problem,
      novelty,
      resources,
      achievements,
      content;

  Passport({
    required this.id,
    this.status,
    this.description,
    this.goal,
    this.objectives,
    this.expected_result,
    this.current_result,
    this.problem,
    this.novelty,
    this.resources,
    this.achievements,
    this.content,
  });

  factory Passport.fromJson(Map<String, dynamic> json) =>
      _$PassportFromJson(json);

  Map<String, dynamic> toJson() => _$PassportToJson(this);
}

Passport _$PassportFromJson(Map<String, dynamic> json) => Passport(
      id: json['id_project'] as int,
      status: json['status'] as String?,
      description: json['description'] as String?,
      goal: json['goal'] as String?,
      objectives: json['objectives'] as String?,
      expected_result: json['expected_result'] as String?,
      current_result: json['current_result'] as String?,
      problem: json['problem'] as String?,
      novelty: json['novelty'] as String?,
      resources: json['resources'] as String?,
      achievements: json['achievements'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$PassportToJson(Passport instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'description': instance.description,
      'goal': instance.goal,
      'objectives': instance.objectives,
      'expected_result': instance.expected_result,
      'current_result': instance.current_result,
      'problem': instance.problem,
      'novelty': instance.novelty,
      'resources': instance.resources,
      'achievements': instance.achievements,
      'content': instance.content,
    };
