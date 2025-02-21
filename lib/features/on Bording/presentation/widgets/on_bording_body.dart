import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/custom_indicator.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/presentation/pages/login/login_view.dart';
import 'package:fruits_market/features/on%20Bording/presentation/widgets/custom_page_view.dart';
import 'package:get/get.dart';

class OnBordingBody extends StatefulWidget {
  const OnBordingBody({super.key});

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const VerticalSpace(18),
            Expanded(
              child: CustomPageView(pageController: pageController),
            ),
            CustomIndicator(
              dotIndex:
                  pageController.hasClients ? pageController.page ?? 0 : 0,
            ),
            SizedBox(height: SizeConfig.defaultSize! * 6),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 11),
              child: CustomGeneralButton(
                onTap: () {
                  if ((pageController.page ?? 0) < 2) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOutBack,
                    );
                  } else {
                    Get.to(() => const LoginView(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 500));
                  }
                },
                text: pageController.hasClients
                    ? (pageController.page == 2 ? "Get Started" : "Next")
                    : "Next",
              ),
            ),
            SizedBox(height: SizeConfig.defaultSize! * 7),
          ],
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 5,
          right: SizeConfig.defaultSize! * 2,
          child: Visibility(
            visible: pageController.hasClients
                ? (pageController.page ?? 0) < 2
                : true,
            child: TextButton(
              onPressed: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInCubic,
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 1.4,
                  color: const Color(0xff898989),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
