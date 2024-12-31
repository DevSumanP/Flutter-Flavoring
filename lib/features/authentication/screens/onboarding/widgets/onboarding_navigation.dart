import 'package:alpas/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:alpas/utils/constants/colors.dart';
import 'package:alpas/utils/constants/sizes.dart';
import 'package:alpas/utils/device/device_utility.dart';
import 'package:alpas/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
              activeDotColor: isDarkMode ? AppColors.light : AppColors.dark,
              dotHeight: 6.0),
          controller: controller.pageController,
          count: 3),
    );
  }
}
