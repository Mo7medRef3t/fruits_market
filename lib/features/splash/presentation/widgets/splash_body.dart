import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/on%20Bording/presentation/on_bording_view.dart';
import 'package:get/get.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
        lowerBound: 0.2,
        upperBound: 1);
    animationController?.repeat(reverse: true);
    goNextPage();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(27),
        FadeTransition(
          opacity: animationController!,
          child: const Text(
            "Fruit Market",
            style: TextStyle(
                color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ),
        Container(height: 40),
        Image.asset("images/splash_view_image.png")
      ],
    );
  }
}

void goNextPage() {
  Future.delayed(const Duration(seconds: 5), () {
    Get.to(()=>const OnBordingView(),transition: Transition.upToDown);
  });
}


