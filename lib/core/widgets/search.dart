import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            height: 40,
            width: SizeConfig.screenWidth,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ) ,
                filled: true,
                prefixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              ),
            )));
  }
}
