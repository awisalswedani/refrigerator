import 'package:flutter_application_1/test.dart'; // Adjust the import path as per your project structure

String? validateForm(FormStateNotifier formState, String selectedCategory) {
  if (formState.name == null || formState.name!.isEmpty) {
    return "Please enter the name.";
  }
  if (formState.purchaseDate == null || formState.purchaseDate!.isEmpty) {
    return "Please enter the purchase date.";
  }
  if (formState.expirationDate == null || formState.expirationDate!.isEmpty) {
    return "Please enter the expiration date.";
  }
  if (formState.quantity == null || formState.quantity!.isEmpty) {
    return "Please enter the quantity.";
  }
  if (formState.unit == null || formState.unit!.isEmpty) {
    return "Please enter the unit.";
  }
  if (formState.marketName == null || formState.marketName!.isEmpty) {
    return "Please enter the market name.";
  }
  if (formState.notes == null || formState.notes!.isEmpty) {
    return "Please enter the notes.";
  }
  if (formState.imageUrl == null || formState.imageUrl!.isEmpty) {
    return "Please select an image.";
  }
  if (selectedCategory.isEmpty) {
    return "Please choose a category.";
  }
  return null; // No validation errors
}
