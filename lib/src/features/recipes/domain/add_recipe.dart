import 'dart:convert';

import 'package:flutter/foundation.dart';

enum Category {
  Pastries,
  Grills,
  Soups,
  All,
}

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.Pastries:
        return 'Pastries';
      case Category.Grills:
        return 'Grills';
      case Category.Soups:
        return 'Soups';
      case Category.All:
        return 'All';
      default:
        return '';
    }
  }
}

class RecipeModel {
  final String id;
  final List<Category> categories;
  final String imageUrl;
  final String name;
  final String ingredients;
  final String description;
  final bool isClicked;

  RecipeModel({
    required this.id,
    required this.categories,
    required this.imageUrl,
    required this.name,
    required this.ingredients,
    required this.description,
    required this.isClicked,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeModel &&
        other.id == id &&
        listEquals(other.categories, categories) &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.ingredients == ingredients &&
        other.description == description &&
        other.isClicked == isClicked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        imageUrl.hashCode ^
        name.hashCode ^
        ingredients.hashCode ^
        description.hashCode ^
        isClicked.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories.map((cat) => cat.index).toList(), // Store categories as enum indices
      'imageUrl': imageUrl,
      'name': name,
      'ingredients': ingredients,
      'description': description,
      'isClicked': isClicked,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'] as String,
      categories: (map['categories'] as List<int>).map((index) => Category.values[index]).toList(),
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      ingredients: map['ingredients'] as String,
      description: map['description'] as String,
      isClicked: map['isClicked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
