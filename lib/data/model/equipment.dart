part of 'project.dart';

class Equipment {
  final int id;
  final String name;
  final String? content;
  final String? img;
  final List<Tag> tags;

  Equipment({
    required this.id,
    required this.name,
    this.content,
    this.img,
    required this.tags,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
}

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'] as int,
      name: json['name'] as String,
      img: json['img'] as String?,
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
