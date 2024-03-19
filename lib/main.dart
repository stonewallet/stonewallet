import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stone_wallet_main/API/createNotification/createnotification.dart';
import 'package:stone_wallet_main/UI/Home/provider/notification_provider.dart';
import 'package:stone_wallet_main/UI/Trips/provider/new_trip_provider.dart';
import 'package:stone_wallet_main/UI/splash/splash_view.dart/splash_view.dart';
import 'package:stone_wallet_main/controller/local/local_database.dart';

import 'UI/Constants/colors.dart';
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

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApiServiceForCreateNotification(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stone Wallet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: purpleColor),
          useMaterial3: true,
        ),
        home: SplashView(),
      ),
    );
  }
}
