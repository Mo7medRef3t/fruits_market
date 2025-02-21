import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/custom_card.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/presentation/pages/login/login_view.dart';
import 'package:fruits_market/features/Screens/widgets/favorite_screen.dart';
import 'package:get/get.dart';

import '../../../core/widgets/pick_image.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: SizeConfig.defaultSize! * 20,
              width: SizeConfig.screenWidth,
              color: KMainColor,
              child: Column(children: [
                const VerticalSpace(3),
                UserImagePicker(
                  onPickImage: (File pickedimage) {
                    selectedImage = pickedimage;
                  },
                ),
                const Text(
                  "Mohamed Refaat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "@mr",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                )
              ])),
          CustomCard(
              icon: const Icon(Icons.shopping_bag_rounded),
              text: "My Orders",
              onTap: () {}),
          CustomCard(
              icon: const Icon(Icons.favorite),
              text: "Favourites",
              onTap: () {
                Get.to(() => const FavoriteScreen(),
                    transition: Transition.upToDown);
              }),
          CustomCard(
              icon: const Icon(Icons.settings), text: "Settings", onTap: () {}),
          CustomCard(
              icon: const Icon(Icons.shopping_cart),
              text: "My Cart",
              onTap: () {}),
          CustomCard(
              icon: const Icon(Icons.star), text: "Rate Us", onTap: () {}),
          CustomCard(
              icon: const Icon(Icons.share),
              text: "Refer a Friend",
              onTap: () {}),
          CustomCard(icon: const Icon(Icons.help), text: "Help", onTap: () {}),
          CustomCard(
            icon: const Icon(Icons.logout),
            text: "Log Out",
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.to(() => const LoginView(), transition: Transition.downToUp);
            },
          ),
        ],
      ),
    );
  }
}
