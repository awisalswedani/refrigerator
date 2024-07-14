import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/items_category.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/recipe_form_field_widget.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/recipe_picker_widget.dart'; // Import the RecipePickerWidget
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/save_button_widget.dart'; // Import the SaveButtonWidget
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/size_text_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/products.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  String selectedIngredient = "Pastries";
  String selectedCategory = ""; // Track selected category
  bool isPublished = false; // Track if recipe is published
  String imageUrl = "";

  final List<String> ingredients = ["Pastries", "Grills", "Soups"];

  void _addImage(String imageUrl) {
    setState(() {
      this.imageUrl = imageUrl;
    });
  }

  void _togglePublishState() {
    setState(() {
      isPublished = !isPublished; // Toggle published state
    });
  }

  void _saveRecipe() {
    String name = nameController.text;
    String details = detailsController.text;
    String notes = notesController.text;

    FirebaseFirestore.instance.collection("recipes").add({
      "name": name,
      "category": selectedCategory,
      "details": details,
      "notes": notes,
      "isPublished": isPublished,
      "imageUrl": imageUrl,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 960,
          child: Form(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    ImagesApp.page,
                    fit: BoxFit.cover,
                  ),
                ),
                const AppBarWidget(
                  icon: Icon(Icons.notifications_none),
                ),
                const Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: TitleWidget(
                    title: "Add New Recipe",
                    subTitle: "Add item to your refrigerator",
                  ),
                ),
                Positioned(
                  top: 125,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: ingredients.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIngredient = ingredients[index];
                                    });
                                  },
                                  child: Products(
                                    text: ingredients[index],
                                    isSelected: selectedIngredient ==
                                        ingredients[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        RecipePickerWidget(
                          onImageSelected: _addImage,
                        ),
                        const SizedBox(height: 10),
                        RecipeFormFieldWidget(
                          text: "Name",
                          controller: nameController,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Column(
                              children: [
                                const Text(
                                  "Ingredients:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ItemCategory(
                                      text: "Tomato",
                                      isSelected: selectedCategory == "Tomato",
                                      onSelect: (isSelected) {
                                        setState(() {
                                          selectedCategory =
                                              isSelected ? "Tomato" : "";
                                        });
                                      },
                                    ),
                                    ItemCategory(
                                      text: "Pepper",
                                      isSelected: selectedCategory == "Pepper",
                                      onSelect: (isSelected) {
                                        setState(() {
                                          selectedCategory =
                                              isSelected ? "Pepper" : "";
                                        });
                                      },
                                    ),
                                    ItemCategory(
                                      text: "Corn",
                                      isSelected: selectedCategory == "Corn",
                                      onSelect: (isSelected) {
                                        setState(() {
                                          selectedCategory =
                                              isSelected ? "Corn" : "";
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        RecipeSizeTextFieldWidget(
                          text: "Details",
                          contentPaddingSize: 35,
                          controller: detailsController,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _togglePublishState,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: isPublished
                                          ? const Icon(Icons.check,
                                              color: Colors.black)
                                          : Container(), // Empty container when not published
                                    ),
                                  ),
                                  const Text(
                                    "Share recipe with community",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SaveButtonWidget(
                          name: nameController.text,
                          selectedCategory: selectedCategory,
                          details: detailsController.text,
                          notes: notesController.text,
                          isPublished: isPublished,
                          imageUrl: imageUrl,
                          selectedIngredient:
                              selectedIngredient, // Pass selected ingredient
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
