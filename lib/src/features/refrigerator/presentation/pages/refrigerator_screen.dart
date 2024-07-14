import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar_widget.dart';
import 'package:flutter_application_1/images_app.dart';
import 'package:flutter_application_1/src/features/refrigerator/application/riverpod/selected_category_provider.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/components/product_item.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/form_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/products.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/title_widget.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefrigeratorScreen extends ConsumerStatefulWidget {
  RefrigeratorScreen({Key? key}) : super(key: key);

  final List<String> list = [
    "Groceries",
    "Dairy Products",
    "Meat Products",
    "+",
  ];

  @override
  _RefrigeratorScreenState createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends ConsumerState<RefrigeratorScreen> {
  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formStateProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Form(
            key: formState.loginFormKey,
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
                    title: "My Refrigerator ",
                    subTitle: "List of items in my refrigerator",
                  ),
                ),
                Positioned(
                    top: 160,
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
                          )),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.filter_list,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
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
                                  ref.read(selectedCategoryProvider.notifier).state = widget.list[index];
                                },
                                child: Products(
                                  text: widget.list[index],
                                  isSelected: selectedCategory == widget.list[index],
                                  onTap: () {
                                    ref.read(selectedCategoryProvider.notifier).state = widget.list[index];
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const ProductItem()
                    ],
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
