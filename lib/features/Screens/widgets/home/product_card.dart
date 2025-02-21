import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/usage/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fruits_market/features/Screens/usage/categories.dart';
import 'package:fruits_market/features/Screens/usage/image.dart';
import 'package:fruits_market/features/Screens/widgets/product_info.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/features/Screens/usage/the_manger.dart';
import 'package:fruits_market/core/widgets/rating_items.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  final String productName;
  
  final String category;
  FavoriteManager favoriteManager = FavoriteManager();

  ProductCard({super.key, required this.productName, required this.category});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImageUrl(widget.category, widget.productName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Error loading image'));
        } else {
          final imageUrl = snapshot.data!;
          return FutureBuilder(
            future: fetchData(widget.productName),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.hasData) {
                return const Center(child: Text('Error loading data'));
              } else {
                final data = snapshot.data!;
                String kcal =
                    data["nutrients"]["ENERC_KCAL"]?.toString() ?? "No Data";
                  final productPrice = productPrices[widget.productName] ?? 0.0;

                return InkWell(
                  onTap: () {
                    Get.to(() => ProductInfo(
                        imageurl: imageUrl,
                        productName: widget.productName,
                        priductPrice: productPrice,
                        kCal: kcal));
                  },
                  child: Stack(
                    children: [
                      buildProductCard(imageUrl, widget.productName, kcal,productPrice),
                      buildFavoriteIcon(widget.productName, imageUrl,productPrice),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  Widget buildProductCard(String imageUrl, String productName, String kcal, double productPrice) {
    return SizedBox(
      width: SizeConfig.defaultSize! * 16,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: SizeConfig.defaultSize! * 13,
                width: SizeConfig.screenWidth,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            RatingItems(productName: productName, itemsize: 22),
            Text(productName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text("\$$productPrice",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.bolt),
                  Text("$kcal Per/100 gm"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildFavoriteIcon(String productName, String imageUrl,double productPrice) {
    return Positioned(
      top: 0,
      right: 8,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.favoriteManager.toggleFavorite(productName, imageUrl,productPrice);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.favoriteManager.isFavorite(productName)
                ? Icons.favorite
                : Icons.favorite_border,
            color: widget.favoriteManager.isFavorite(productName)
                ? Colors.red
                : Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}
