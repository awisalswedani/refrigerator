import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveButtonWidget extends StatefulWidget {
  final String name;
  final String selectedCategory;
  final String details;
  final String notes;
  final bool isPublished;
  final String imageUrl;
  final String selectedIngredient; // New field to store selected ingredient

  const SaveButtonWidget({
    super.key,
    required this.name,
    required this.selectedCategory,
    required this.details,
    required this.notes,
    required this.isPublished,
    required this.imageUrl,
    required this.selectedIngredient,
  });

  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  void _saveRecipeToFirestore(String imageUrl) {
    FirebaseFirestore.instance.collection("recipes").add({
      "name": widget.name,
      "category": widget.selectedCategory,
      "details": widget.details,
      "notes": widget.notes,
      "isPublished": widget.isPublished,
      "imageUrl": imageUrl, // Store image URL instead of local file path
      "ingredients": widget.selectedIngredient, // Save selected ingredient
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recipe added successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add recipe: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(20, 27, 44, 1)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            // Pass imageUrl to _saveRecipeToFirestore method
            _saveRecipeToFirestore(widget.imageUrl);
          },
          child: const Text(
            'Save Recipe',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
