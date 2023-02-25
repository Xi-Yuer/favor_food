import 'dart:convert';
import 'dart:ui';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
  });

  String id;
  String title;
  String color;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],

        /// 将字符串的 color 转化为16进制的color
        color: json["color"],
      );

  @override
  String toString() {
    return 'CategoryModel{id: $id, title: $title, color: $color}';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
      };
}
