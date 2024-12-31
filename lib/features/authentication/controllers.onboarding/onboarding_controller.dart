import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index when Page Scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index; // Correctly updating the value
  }

  // Jump to the specific dot at specified page
  void dotnavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index); // Use jumpToPage instead of jumpTo
  }

  // Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // Navigate to the login screen or any other screen
      // Get.to(LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2); // Use jumpToPage instead of jumpTo
  }
}
