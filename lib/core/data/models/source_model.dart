class SourceModel {
  final String? id;
  final String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJsonMap(
    Map<String, dynamic> jsonMap,
  ) =>
      SourceModel(
        id: jsonMap['id'],
        name: jsonMap['name'],
      );

  Map<String, dynamic> toJsonObject() {
    return {
      'id': id,
      'name': name,
    };
  }
}
