part of 'project.dart';

class ImageEntity {
  final int id;
  final String url;
  final bool isMain;

  ImageEntity({
    required this.isMain,
    required this.id,
    required this.url,
  });

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

ImageEntity _$ImageFromJson(Map<String, dynamic> json) => ImageEntity(
      url: json['url'] as String,
      id: json['id'] as int,
      isMain: json['is_main'] as bool,
    );

Map<String, dynamic> _$ImageToJson(ImageEntity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.url,
    };
