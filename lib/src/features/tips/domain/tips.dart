import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Tip {
    final String id;
    final String name;
    final String details;
    final String category;
  Tip({
    required this.id,
    required this.name,
    required this.details,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'details': details,
      'category': category,
    };
  }

  factory Tip.fromMap(Map<String, dynamic> map) {
    return Tip(
      id: map['id'] as String,
      name: map['name'] as String,
      details: map['details'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tip.fromJson(String source) => Tip.fromMap(json.decode(source) as Map<String, dynamic>);
  }
