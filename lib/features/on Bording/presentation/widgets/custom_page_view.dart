import 'package:flutter/material.dart';
import 'package:fruits_market/features/on%20Bording/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: "images/page view 1.png",
          title: "E Shopping",
          subTitle: "Explore  top organic fruits & grab them",
        ),
        PageViewItem(
          image: "images/page view 2.png",
          title: "Delivery on the way",
          subTitle: "Get your order by speed delivery",
        ),
        PageViewItem(
          image: "images/page view 3.png",
          title: "Delivery Arrived",
          subTitle: "Order is arrived at your Place",
        ),
      ],
    );
  }
}
