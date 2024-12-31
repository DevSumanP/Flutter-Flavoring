import 'package:alpas/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:alpas/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:alpas/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:alpas/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:alpas/utils/constants/images.dart';
import 'package:alpas/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(children: [
        // Horizontal Scrollable Page
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: [
            OnboardingPage(
              title: 'Choose your product',
              image: isDarkMode
                  ? Images.onBoardingImageDark1
                  : Images.onBoardingImageLight1,
              subTitle:
                  'Welcome to a World of limitless Choices - Your Perfect product Awaits!',
            ),
            OnboardingPage(
              title: 'Select payment method',
              image: isDarkMode
                  ? Images.onBoardingImageDark2
                  : Images.onBoardingImageLight2,
              subTitle:
                  'For Seamless Transcations, Choose Your Payment Path - Your Convenience, Our Priority!',
            ),
            OnboardingPage(
              title: 'Deliver at your door step',
              image: isDarkMode
                  ? Images.onBoardingImageDark3
                  : Images.onBoardingImageLight3,
              subTitle:
                  'From Our DoorStep to Yours - Swift, Secure, and Contactless Delivery!',
            ),
          ],
        ),

        // Skip Button
        const OnBoardingSkip(),

        // Smooth Page Indicator
        const OnBoardingNavigation(),

        // Circular Button
        const OnBoardingButton(),
      ]),
    );
  }
}
