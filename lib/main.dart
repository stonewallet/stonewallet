import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stone_wallet_main/UI/splash/splash_view.dart/splash_view.dart';

import 'UI/Constants/colors.dart';
import 'UI/terms_page.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// Set up HttpOverrides before making HTTP requests
void setupHttpOverrides() {
  HttpOverrides.global = MyHttpOverrides();
}


void main() {
  HttpOverrides.global = MyHttpOverrides();
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stone Wallet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: purpleColor),
        useMaterial3: true,
      ),
      home:  SplashView(),
    );
  }
}
