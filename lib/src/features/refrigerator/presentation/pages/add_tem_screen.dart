import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/components/text_forms.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/button_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/form_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/image_picker_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/products.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  AddItemScreen({Key? key}) : super(key: key);

  final List<String> list = [
    "Groceries",
    "Dairy Products",
    "Meat Products",
    "+",
  ];

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends ConsumerState<AddItemScreen> {
  final GlobalKey<FormState> _addItemFormKey = GlobalKey<FormState>();
  String selectedCategory = "Groceries";

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formStateProvider);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Form(
            key: _addItemFormKey,
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
                    title: "Add New Item",
                    subTitle: "Add item to your refrigerator",
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = widget.list[index];
                              });
                            },
                            child: Products(
                              text: widget.list[index],
                              isSelected: selectedCategory == widget.list[index],
                              onTap: () {
                                setState(() {
                                  selectedCategory = widget.list[index];
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 210,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const ImagePickerWidget(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FormFieldWidget(
                                onChanged: (value) {
                                  formState.updateName(value);
                                },
                                text: "Name",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const TextForms(),
                        ButtonWidget(
                          text: "Proceed",
                          selectedCategory: selectedCategory,
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
