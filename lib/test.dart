import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormStateNotifier extends ChangeNotifier {
  String? name;
  String? purchaseDate;
  String? expirationDate;
  String? quantity;
  String? unit;
  String? marketName;
  String? notes;
  String? imageUrl;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updatePurchaseDate(String value) {
    purchaseDate = value;
    notifyListeners();
  }

  void updateExpirationDate(String value) {
    expirationDate = value;
    notifyListeners();
  }

  void updateQuantity(String value) {
    quantity = value;
    notifyListeners();
  }

  void updateUnit(String value) {
    unit = value;
    notifyListeners();
  }

  void updateMarketName(String value) {
    marketName = value;
    notifyListeners();
  }

  void updateNotes(String value) {
    notes = value;
    notifyListeners();
  }

  void updateImageUrl(String value) {
    imageUrl = value;
    notifyListeners();
  }

  void saveForm() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      notifyListeners();
    }
  }
}

final formStateProvider = ChangeNotifierProvider((ref) => FormStateNotifier());
