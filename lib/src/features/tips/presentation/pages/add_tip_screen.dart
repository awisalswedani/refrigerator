import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';
import 'package:flutter_application_1/src/features/tips/presentation/widgets/save_tips_button.dart';
import 'package:flutter_application_1/src/features/tips/presentation/widgets/tips_form_widget.dart';
import 'package:flutter_application_1/src/features/tips/presentation/widgets/tips_size_widget.dart';

class AddTipScreen extends StatefulWidget {
  const AddTipScreen({super.key});

  @override
  _AddTipScreenState createState() => _AddTipScreenState();
}

class _AddTipScreenState extends State<AddTipScreen> {
  List<String> list = [
    "Groceries",
    "Dairy Products",
    "Meat Products",
    "+",
  ];

  String? selectedCategory;
  String name = '';
  String details = '';

  void setName(String value) {
    setState(() {
      name = value;
    });
  }

  void setDetails(String value) {
    setState(() {
      details = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
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
                top: 120,
                left: 0,
                right: 0,
                child: TitleWidget(
                  title: "Add Tip",
                  subTitle: "Add Storage Tips",
                ),
              ),
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40, // Adjust the height of the list container
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final category = list[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                              child: TipsWidget(
                                text: category,
                                isSelected: category == selectedCategory,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20), // Add spacing
                      TipsFormWidget(
                        text: "Name",
                        onChanged: setName,
                      ),
                      TipsSizeWidget(
                        text: "Details",
                        contentPaddingSize: 80,
                        onChanged: setDetails,
                      ),
                      SaveTipsButton(
                        text: "Proceed",
                        selectedCategory: selectedCategory,
                        name: name,
                        details: details,
                      ),
                    ],
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

class TipsWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TipsWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromRGBO(87, 94, 113, 1) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white, // Border color remains black
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
