import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/usage/categories.dart';
import 'package:fruits_market/core/utils/size_config.dart';

class CategoryTabs extends StatelessWidget {
  final TabController tabController;

  const CategoryTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: false,
      indicatorColor: const Color(0xffCC7D00),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicator: BoxDecoration(
        color: const Color(0xffCC7D00),
        borderRadius: BorderRadius.circular(5),
      ),
      tabs: categories.map((category) {
        return Tab(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * .85),
            child: Text(
              category,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
