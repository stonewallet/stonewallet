import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stone_wallet_main/API/GetNotification/get_notification.dart';
import 'package:stone_wallet_main/API/api_provider.dart';
import 'package:stone_wallet_main/UI/Constants/text_styles.dart';
import 'package:stone_wallet_main/UI/Home/provider/notification_provider.dart';
import 'package:stone_wallet_main/UI/Model/notification_model.dart';

import '../Constants/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late ApiServiceForNotification apiServiceForNotification;

  @override
  void initState() {
    apiServiceForNotification = ApiServiceForNotification();
    super.initState();
  }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff182C4B),
      appBar: AppBar(
        leading: GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Icon(
              Icons.arrow_back_ios,
              color: textColor,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff182C4B),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Notifications",
                  style: LargeTextStyle.large20700(whiteColor)),
              const SizedBox(width: 5),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  border: Border.all(color: dotColor),
                  color: dotColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<NotificationModel>>(
        future: apiServiceForNotification.getDataForNotification(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No data",
                style: LargeTextStyle.large18800(whiteColor),
              ),
            );
          } else {
            final List<NotificationModel> notifications = snapshot.data!;

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                String message = notifications[index].message;
                NotificationModel notification = notifications[index];
                int maxLength = message.length ~/ 2;
                String truncatedMessage =
                    '${message.substring(0, maxLength)}...';

                // Access metaData list from NotificationModel
                List<MetaDatum> metaData = notification.metaData;

                // print(metaTitle);

                return Card(
                  elevation: 2,
                  color: transparent,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 3),
                    height: notificationProvider.expandedIndices.contains(index)
                        ? null
                        : height / 12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            var response = await apiServiceForNotification
                                .readMessage(notifications[index].id);
                            if (response.message != null) {}
                            notificationProvider.toggleExpansion(index);
                            // setState(() {
                            //   // Toggle visibility for the tapped notification
                            //   if (expandedIndices.contains(index)) {
                            //     expandedIndices.remove(index);
                            //   } else {
                            //     expandedIndices
                            //         .clear(); // Collapse other notifications
                            //     expandedIndices.add(index);
                            //   }
                            // });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: width * 0.03),
                                  Icon(
                                    Entypo.message,
                                    color: notifications[index].readMessage
                                        ? whiteColor.withOpacity(0.6)
                                        : Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    truncatedMessage,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: RegularTextStyle.regular15600(
                                      notifications[index].readMessage
                                          ? whiteColor.withOpacity(0.6)
                                          : Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: width / 3.5),
                                  SizedBox(
                                    height: 25,
                                    child: IconButton(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 10, 5),
                                      onPressed: () async {
                                        var response =
                                            await apiServiceForNotification
                                                .deleteMessage(
                                                    notifications[index].id);
                                        if (response.message != null) {
                                          Get.back();
                                          Get.snackbar(
                                            " Deleted successfully",
                                            '',
                                            backgroundColor: newGradient6,
                                            colorText: whiteColor,
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        
                                        } else {
                                          Get.snackbar(
                                            "Something gone wrong",
                                            '',
                                            backgroundColor: newGradient6,
                                            colorText: whiteColor,
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: redColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (notificationProvider.expandedIndices
                            .contains(index))
                          readNotification(width, notifications[index],
                              metaData[0], notificationProvider, index),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget readNotification(double width, NotificationModel notifications,
      MetaDatum metaDatum, NotificationProvider notificationProvider, index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notifications.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Container(
                    width: width * 0.30,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [greenAccentColor, gradientColor8],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text('Accept',
                        textAlign: TextAlign.center,
                        style: RegularTextStyle.regular18600(whiteColor))),
                onTap: () async {
                  print(metaDatum.tripId);
                  var response = await ApiProvider()
                      .processAddUser(int.parse(metaDatum.tripId));
                  if (response.message != null) {
                    notificationProvider.toggleExpansion(index);
                    Get.snackbar(
                      response.message!,
                      '',
                      backgroundColor: newGradient6,
                      colorText: whiteColor,
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      duration: const Duration(milliseconds: 4000),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      "Something gone wrong",
                      '',
                      backgroundColor: newGradient6,
                      colorText: whiteColor,
                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                      duration: const Duration(milliseconds: 4000),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
              ),
              SizedBox(
                width: width / 8,
              ),
              GestureDetector(
                child: Container(
                    width: width * 0.30,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [redColor, gradientColor8],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text('Decline',
                        textAlign: TextAlign.center,
                        style: LargeTextStyle.large20700(whiteColor))),
                onTap: () {
                  notificationProvider.toggleExpansion(index);
                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
