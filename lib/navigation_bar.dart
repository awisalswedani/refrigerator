import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/recipes/presentation/pages/explore_recipes_screen.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/pages/add_tem_screen.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/pages/refrigerator_screen.dart';
import 'package:flutter_application_1/src/features/tips/presentation/pages/tips_screen.dart';
import 'package:iconsax/iconsax.dart';

class NavigationBaar extends StatefulWidget {
  const NavigationBaar({super.key});

  @override
  State<NavigationBaar> createState() => _CustomNavigationBaarState();
}

class _CustomNavigationBaarState extends State<NavigationBaar> {
  int myIndex = 0;
  final List<Widget> pages = [
    RefrigeratorScreen(),
    ExploreRecipesPage(),
    TipsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(87, 94, 113, 1),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddItemScreen(),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: const Color.fromRGBO(118, 81, 123, 1),
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Iconsax.book_square,
                  color: myIndex == 0 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    myIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.receipt_long,
                  color: myIndex == 1 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    myIndex = 1;
                  });
                },
              ),
              const SizedBox(width: 48), // The space for the floating action button
              IconButton(
                icon: Icon(
                  Icons.tips_and_updates_outlined,
                  color: myIndex == 2 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    myIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: myIndex == 3 ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    myIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: pages[myIndex],
    );
  }
}
