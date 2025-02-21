import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/usage/api_service.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/add_items.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';

import '../usage/the_manger.dart';

// ignore: must_be_immutable
class ProductInfo extends StatelessWidget {
   ProductInfo(
      {super.key,
      required this.imageurl,
      required this.productName,
      required  this.kCal, required this.priductPrice});
  final String imageurl;
  final String  productName;
  final String kCal;
  final double? priductPrice ;
    final ShoppingManager shoppingManager = ShoppingManager();
double quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.white),
          backgroundColor: KMainColor,
          title: const Text(
            "DETAILS",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Container(
                margin: EdgeInsets.all(SizeConfig.defaultSize! * 2.2),
                width: SizeConfig.screenWidth,
                height: SizeConfig.defaultSize! * 20,
                child: Image.network(imageurl, height: 100, fit: BoxFit.fill),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                "Nutrition",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
                future: fetchData(productName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Error loading nutrition data'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final nutrients = snapshot.data!['nutrients'];
                    final List<String> nutritionItems = [
                      "Fat: ${nutrients['FAT'] ?? 'N/A'}",
                      "PROCNT: ${nutrients['PROCNT'] ?? 'N/A'}",
                      "FIBTG: ${nutrients['FIBTG'] ?? 'N/A'}",
                      "CHOCDF: ${nutrients['CHOCDF'] ?? 'N/A'}",
                    ];
                    return Container(
                        padding: const EdgeInsets.only(bottom: 16),
                        height: SizeConfig.defaultSize! * 24,
                        child: ListView.builder(
                          itemCount: nutritionItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.circle, size: 10),
                              title: Text(
                                nutritionItems[index],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            );
                          },
                        ));
                  }
                }),
                  Container(
                  height: SizeConfig.defaultSize! * 7,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.only(left: SizeConfig.defaultSize!),
              child: Row(
                children: [
                  const Spacer(flex: 1,),
                  Text(
                    "\$ $priductPrice",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(flex: 2,),
                  
                  SizedBox(
                    // ignore: avoid_types_as_parameter_names
                    child: AddItems(productName: productName, 
                        onQuantityChanged: (quantityValue) {
                                      quantity = quantityValue; 
                                    },
                      ),
                  ),
                  const Spacer(flex: 1,)
                ])),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.bolt),
                  Text(
                    "$kCal Per/100 gm",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Container(
                      margin: EdgeInsets.only(right: SizeConfig.defaultSize!),
                      width: 150,
                      child:
                          CustomGeneralButton(text: "Buy Now", onTap: () {
                            shoppingManager.addToCart(productName, imageurl, quantity);
                          })),
                ],
              ),
            )
          ],
        ));
  }
}
