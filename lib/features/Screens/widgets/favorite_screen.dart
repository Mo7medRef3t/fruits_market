import 'package:fruits_market/features/Screens/usage/the_manger.dart';
import 'package:fruits_market/features/Screens/widgets/product_info.dart';
import 'package:fruits_market/core/widgets/rating_items.dart';
import 'package:fruits_market/core/widgets/add_items.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/usage/api_service.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final box = GetStorage();
  final FavoriteManager favoriteManager = FavoriteManager();
  final ShoppingManager shoppingManager = ShoppingManager();

  @override
  Widget build(BuildContext context) {
    List<dynamic>? savedFavorites = box.read<List<dynamic>>('favorites');
    List<Map<String, dynamic>> favoriteProducts =
        savedFavorites!.cast<Map<String, dynamic>>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KMainColor,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                String productName = favoriteProducts[index]["name"]!;
                String imageUrl = favoriteProducts[index]["image"]!;
                // double productPrice = favoriteProducts[index]["price"]!;
                double quantity = 0;

                return FutureBuilder<Map<String, dynamic>>(
                  future: fetchData(productName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading data'));
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Center(child: Text('No data available'));
                    } else {
                      final data = snapshot.data!;
                      String kcal =
                          data["nutrients"]["ENERC_KCAL"]?.toString() ??
                              "No Data";

                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductInfo(
                              priductPrice: 0,
                              imageurl: imageUrl,
                              productName: productName,
                              kCal: kcal));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.defaultSize! * 15.2,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Image.network(imageUrl,
                                    width: SizeConfig.defaultSize! * 11,
                                    height: SizeConfig.defaultSize! * 11,
                                    fit: BoxFit.cover),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Organic Product",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const VerticalSpace(0.5),
                                  RatingItems(
                                      productName: productName, itemsize: 20),
                                  AddItems(
                                    productName: productName,
                                    onQuantityChanged: (quantityValue) {
                                      quantity = quantityValue;
                                    },
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "$kcal Per/100 gm",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 60,
                                    child: CustomGeneralButton(
                                      text: "Add",
                                      onTap: () {
                                        shoppingManager.addToCart(
                                            productName, imageUrl, quantity);
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
    );
  }
}
