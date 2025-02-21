import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import '../../usage/categories.dart';
import 'category_tabs.dart';
import 'product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(3),
        CategoryTabs(tabController: _tabController),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: categories.map((category) {
              return buildCategoryView(category);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildCategoryView(String category) {
    return ListView(
      children: getSubCategories(category).map((subcategory) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.defaultSize! * 1.5,
                bottom: SizeConfig.defaultSize! * 1.5,
              ),
              child: Text(
                subcategory,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 25,
              child: buildProductList(category, subcategory),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildProductList(String category, String subcategory) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getItemsByCategory(category, subcategory).length,
      itemBuilder: (context, i) {
        final productName = getItemsByCategory(category, subcategory)[i];
        return ProductCard(
          productName: productName,
           category: category,
        );
      },
    );
  }
}
