import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stone_wallet_main/UI/Home/home_page.dart';
import 'package:stone_wallet_main/UI/welcome_page.dart';

class SplashController extends GetxController {
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
     checkLoginStatus();
    // Navigate to the SignIn screen
    // Get.off(() => SigninView());
  }

  void increment() => count.value++;
  void checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? csrfToken = prefs.getString('csrfToken');
    final String? sessionId = prefs.getString('sessionId');

    if (csrfToken != null && sessionId != null) {
      Get.off(() => const BottomNavigationPage());
    } else {
      Get.off(() => const WelcomePage());
    }
  }
}
