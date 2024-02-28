import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/API/add_assets/add_assets.dart';
import 'package:stone_wallet_main/API/createWallet/createnewwallet.dart';
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
    // checkLoginStatus();
    // Navigate to the SignIn screen
    walletResponse = await ApiServiceForCreateWallet()
        .createWallet(userController.text, passwordController.text);
    if (walletResponse.mnemonicSeed.isNotEmpty) {
      ApiServiceForADDAssets().createPortfolio1();

      Get.to(() => const CreateNewWalletPage3());
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) =>
      //           const CreateNewWalletPage3()),
      // );
      // Get.to(() => const CreateNewWalletPage3());
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
