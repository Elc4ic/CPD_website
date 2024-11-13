part of 'project.dart';

class ImageEntity {
  final int id;
  final String url;
  final int projectId;

  ImageEntity({
    required this.id,
    required this.projectId,
    required this.url,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

ImageEntity _$ImageFromJson(Map<String, dynamic> json) => ImageEntity(
      url: json['url'] as String,
      id: json['id'] as int,
      projectId: json['project_id'] as int,
    );

Map<String, dynamic> _$ImageToJson(ImageEntity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.url,
      'project_id': instance.projectId,
    };
