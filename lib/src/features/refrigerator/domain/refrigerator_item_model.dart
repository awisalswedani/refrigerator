class RefrigeratorItemModel {
  final String name;
  final String purchaseDate;
  final String expirationDate;
  final String quantity;
  final String unit;
  final String marketName;
  final String notes;
  final String imageUrl;
  final String category; // Add this line

  RefrigeratorItemModel({
    required this.name,
    required this.purchaseDate,
    required this.expirationDate,
    required this.quantity,
    required this.unit,
    required this.marketName,
    required this.notes,
    required this.imageUrl,
    required this.category, // Add this line
  });

  factory RefrigeratorItemModel.initial() {
    return RefrigeratorItemModel(
      name: '',
      purchaseDate: '',
      expirationDate: '',
      quantity: '',
      unit: '',
      marketName: '',
      notes: '', 
      imageUrl: '',
      category: '', // Add this line
    );
  }

  RefrigeratorItemModel copyWith({
    String? name,
    String? purchaseDate,
    String? expirationDate,
    String? quantity,
    String? unit,
    String? marketName,
    String? notes,
    String? imageUrl,
    String? category, // Add this line
  }) {
    return RefrigeratorItemModel(
      name: name ?? this.name,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expirationDate: expirationDate ?? this.expirationDate,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      marketName: marketName ?? this.marketName,
      notes: notes ?? this.notes,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category, // Add this line
    );
  }

  factory RefrigeratorItemModel.fromMap(Map<String, dynamic> map) {
    return RefrigeratorItemModel(
      name: map['name'],
      purchaseDate: map['purchaseDate'],
      expirationDate: map['expirationDate'],
      quantity: map['quantity'],
      unit: map['unit'],
      marketName: map['marketName'],
      notes: map['notes'], 
      imageUrl: map['imageUrl'],
      category: map['category'], // Add this line
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'purchaseDate': purchaseDate,
      'expirationDate': expirationDate,
      'quantity': quantity,
      'unit': unit,
      'marketName': marketName,
      'notes': notes,
      'imageUrl': imageUrl,
      'category': category, // Add this line
    };
  }
}
