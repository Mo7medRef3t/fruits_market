import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/widgets/home/home_screen.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/search.dart';

import '../../../../core/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: SizeConfig.defaultSize! * 10,
                color: KMainColor,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  title: const Text(
                    "Fruit Market",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: HomeScreen()
              ),
            ],
          ),
          Positioned(
            top: SizeConfig.defaultSize! * 8, 
            left: SizeConfig.defaultSize! * 2,
            right: SizeConfig.defaultSize! * 2,
            child: const Search(),
          ),
        ],
      ),
    );
  }
}
