import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image,required this.title,@required this.subTitle});
  final String? image;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image!),
        const VerticalSpace(2),
        Text(
          title!,
          style: const TextStyle(
              fontSize: 20,
              color: Color(0xff2f2e41),
              fontWeight: FontWeight.w700),
        ),
        const VerticalSpace(1),
        Text(subTitle!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Color(0xff78787c),
            ))
      ],
    );
  }
}
