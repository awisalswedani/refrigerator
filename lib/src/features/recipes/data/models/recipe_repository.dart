import 'package:flutter_application_1/src/features/recipes/domain/add_recipe.dart';

abstract class RecipeRepository {
  Future<List<RecipeModel>> getAllRecipes();
  Future<RecipeModel?> getRecipeById(String id);
  Future<void> addRecipe(RecipeModel recipe);
  Future<void> updateRecipe(RecipeModel recipe);
  Future<void> deleteRecipe(String id);
}
