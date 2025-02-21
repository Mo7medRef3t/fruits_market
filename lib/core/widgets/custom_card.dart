import 'package:flutter/material.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/core/utils/size_config.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.icon,required this.text,required this.onTap});

  final Icon? icon;
  final String? text;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.defaultSize! * 6,
      child: Card(
          child: ListTile(
        tileColor: Colors.white,
        textColor: KMainColor,
        iconColor: KMainColor,
        leading: icon,
        title: Text(
          text!,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        onTap: onTap,
      )),
    );
  }
}
