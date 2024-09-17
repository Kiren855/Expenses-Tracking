class Category {
  String icon;
  String name;
  String type;

  Category({required this.name, required this.icon, required this.type});

  Category.fromJson(Map<String, Object?> json)
      : this(
            name: json['name']! as String,
            icon: json['icon']! as String,
            type: json['type']! as String);

  Category copyWith({String? name, String? icon, String? type}) {
    return Category(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        type: type ?? this.type);
  }

  Map<String, Object?> toJson() {
    return {'name': name, 'icon': icon, 'type': type};
  }

  @override
  String toString() {
    return 'Category(icon: $icon, name: $name, type: $type)';
  }
}
