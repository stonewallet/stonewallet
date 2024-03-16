// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:stone_wallet_main/UI/Constants/colors.dart';
// import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
// import 'package:stone_wallet_main/UI/Model/notification_model.dart';

// class ReadNotificationScreen extends StatefulWidget {
//   final NotificationModel notificationModel;
//   const ReadNotificationScreen({super.key, required this.notificationModel});

//   @override
//   State<ReadNotificationScreen> createState() => _ReadNotificationScreenState();
// }

// class _ReadNotificationScreenState extends State<ReadNotificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     // double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xff182C4B),
//       appBar: AppBar(
//         leading: GestureDetector(
//           child: Container(
//             margin: const EdgeInsets.only(left: 30),
//             child: const Icon(
//               Icons.arrow_back_ios,
//               color: textColor,
//             ),
//           ),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: const Color(0xff182C4B),
//         centerTitle: true,
//         title: Text(
//           "Notification",
//           style: RegularTextStyle.regular18600(whiteColor),
//         ),
//       ),
//       body: readNotification(width),
//     );
//   }

 
// }
