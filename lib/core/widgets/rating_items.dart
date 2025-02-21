import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';

class RatingItems extends StatefulWidget {
  const RatingItems({super.key, required this.productName, required this.itemsize});
  final String productName;
  final double itemsize;

  @override
  State<RatingItems> createState() => _RatingItemsState();
}

class _RatingItemsState extends State<RatingItems> {
  final box = GetStorage();
  double rating = 0.0;

  @override
  void initState() {
    super.initState();

    // تحميل التقييم من التخزين عند بداية التشغيل
    if (box.hasData('ratings')) {
      Map<String, double> storedRatings = Map<String, double>.from(box.read('ratings'));
      rating = storedRatings[widget.productName] ?? 0.0;
    }
  }

  void updateRating(double newRating) {
    setState(() {
      rating = newRating;
      // تحديث التقييم في التخزين
      Map<String, double> storedRatings = Map<String, double>.from(box.read('ratings') ?? {});
      storedRatings[widget.productName] = newRating;
      box.write('ratings', storedRatings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: widget.itemsize,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (newRating) {
        updateRating(newRating);
      },
    );
  }
}
