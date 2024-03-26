import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/API/createWallet/createnewwallet.dart';
import 'package:stone_wallet_main/UI/Constants/colors.dart';
import 'package:stone_wallet_main/UI/Constants/urls.dart';
import 'package:stone_wallet_main/UI/Create%20New%20Wallet/create_new_wallet_2.dart';
import 'package:stone_wallet_main/UI/Create%20New%20Wallet/create_new_wallet_3.dart';
import 'package:stone_wallet_main/UI/terms_page.dart';

class LoadingController extends GetxController {
  final _loading = true.obs;
  bool get loading => _loading.value;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    super.onInit();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 5));

    _loading.value = false;

    try {
      walletResponse = await ApiServiceForCreateWallet().createWallet(
        name: userController.text,
        pass: passController.text,
      );
      print(walletResponse.mnemonicSeed);

      if (walletResponse.mnemonicSeed.isNotEmpty) {
        ApiServiceForADDAssets().createPortfolio1();

        Get.off(() => const CreateNewWalletPage3());
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Wallet Already Exit",
        '',
        backgroundColor: newGradient6,
        colorText: whiteColor,
        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
        duration: const Duration(milliseconds: 4000),
        snackPosition: SnackPosition.BOTTOM,
      );
      print('Error creating wallet: $e');
      // Stop the controller or perform any other necessary actions here
    }
  }

  void increment() => count.value++;
  void checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? csrfToken = prefs.getString('csrfToken');
    final String? sessionId = prefs.getString('sessionId');

    if (csrfToken != null && sessionId != null) {
      Get.off(() => const TermsOfPage());
    } else {
      Get.off(() => const TermsOfPage());
    }
  }
}
