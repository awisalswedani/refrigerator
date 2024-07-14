import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/form_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';
import 'package:flutter_application_1/src/features/tips/presentation/pages/add_tip_screen.dart';
import 'package:flutter_application_1/src/features/tips/presentation/widgets/tips_title_widget.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final List<String> list = [
    "Groceries",
    "Dairy Products",
    "Meat Products",
    "All",
    "+",
    "more"
  ];
  String? selectedCategory;

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
                  title: "Storage Tips",
                  subTitle: "List of storage Tips",
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
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 40,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: selectedCategory != null
                          ? StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('tips')
                                  .where('category',
                                      isEqualTo: selectedCategory)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }
                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Text(
                                      'No tips found for this category.');
                                }
                                final tips = snapshot.data!.docs;
                                return Column(
                                  children: tips.map((doc) {
                                    final data =
                                        doc.data() as Map<String, dynamic>;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: SizedBox(
                                        width: 850,
                                        child: TipsTitleWidget(
                                          title: data['name'] ?? 'No Name',
                                          subTitle:
                                              data['details'] ?? 'No Details',
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            )
                          : const Text('Please select a category.'),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 65.0, // Adjust the position of FAB as needed
                right: 6.0,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: FloatingActionButton(
                    heroTag: 'addTips', // Add a unique tag
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AddTipScreen(), // Navigate to AddRecipePage
                        ),
                      );
                    },
                    backgroundColor: const Color.fromRGBO(
                        15, 27, 50, 1), // Optional: Set background color
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.tips_and_updates_outlined,
                      color: Colors.white,
                    ), // Make it circular
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
          color: Colors.white,
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
