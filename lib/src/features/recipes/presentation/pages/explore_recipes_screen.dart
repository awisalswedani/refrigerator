import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/pages/add_recipe_screen.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/widgets/post_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/form_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/products.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';
import 'package:iconsax/iconsax.dart';

class ExploreRecipesPage extends StatelessWidget {
  ExploreRecipesPage({super.key});

  final List<String> list = ["Pastries", "Grills", "Soups", "All"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Adjust height as needed
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  ImagesApp.page,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBarWidget(
                  icon: Icon(Icons.notifications_none),
                ),
              ),
              const Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: TitleWidget(
                  title: "Recipes",
                  subTitle: "List of Shared Recipes",
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      const Expanded(
                        child: FormFieldWidget(
                          text: "Search",
                          icon: Icons.search,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_list,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: 0,
                right: 0,
                bottom:
                    80, // Adjust this to give space for the PostWidget and FAB
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Products(
                              text: list[index],
                              isSelected:
                                  false, // Provide a default value for isSelected
                            );
                          },
                        ),
                      ),
                      const Expanded(
                        child: PostWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 65.0, // Adjust the position of FAB as needed
                right: 6.0,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AddRecipePage(), // Navigate to AddRecipePage
                        ),
                      );
                    },
                    backgroundColor: const Color.fromRGBO(
                        15, 27, 50, 1), // Optional: Set background color
                    shape: const CircleBorder(), // Make it circular
                    heroTag: "addRecipeFAB",
                    child: const Icon(
                      Iconsax.book,
                      color: Colors.white,
                    ), // Unique tag to avoid conflicts
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
