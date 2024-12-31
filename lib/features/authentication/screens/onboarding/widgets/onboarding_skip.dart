import 'package:alpas/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers.onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: AppSizes.defaultSpace - 24,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: Text(
              'Skip',
              style: Theme.of(context).textTheme.labelMedium,
            )));
  }
}
