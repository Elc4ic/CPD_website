part of 'project.dart';

class Equipment {
  final String name;
  final String? description;
  final String img;

  Equipment({
    this.description,
    required this.name,
    required this.img,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
}

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      description: json['description'] as String?,
      name: json['name'] as String,
      img: json['img'] as String,
    );
