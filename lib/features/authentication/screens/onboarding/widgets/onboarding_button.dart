import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: DeviceUtils.getBottomNavigationBarHeight() - 25,
        right: AppSizes.defaultSpace,
        child: ElevatedButton(
            onPressed: () => OnBoardingController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor:
                    isDarkMode ? AppColors.primary : AppColors.dark),
            child: const Icon(Iconsax.arrow_right_1)));
  }
}
