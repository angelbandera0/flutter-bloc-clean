import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


void initializeAwesomeNotifications() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true, channelDescription: '')
  ]);
}

Future<void> createAuctionWinnerNotification(
    Map<String, String> payload) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title:
            '${Emojis.activites_fireworks + Emojis.activites_fireworks} You won the auction!!!',
        body: 'Congrats!!!',
        bigPicture: 'asset://assets/images/no_car_added.png',
        notificationLayout: NotificationLayout.BigPicture,
        payload: payload),
  );
}

Future<void> createAuctionOwnerNotification(Map<String, String> payload) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 2,
        channelKey: 'basic_channel',
        title: '${Emojis.money_money_bag} Auction Result!!!',
        body: 'Your auction have a winner',
        notificationLayout: NotificationLayout.BigText,
        payload: payload),
  );
}

Future<void> createAuctionLooserNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'basic_channel',
      title: 'You lost the auction',
      body: 'Good luck for the next one',
      notificationLayout: NotificationLayout.Default,
    ),
  );
}

void initNotificationService(BuildContext context) {
  _checkNotificationPermissions(context);
  _listenNotificationStreamAction(context);
}

void _checkNotificationPermissions(BuildContext context) {
 /* AwesomeNotifications().isNotificationAllowed().then((value) {
    if (!value) {
      showDialog(
          context: context,
          builder: (context) => CustomNotificationAlertDialog());
    }
  });*/
}

void _listenNotificationStreamCreated(BuildContext context) {
  /*AwesomeNotifications().createdStream.listen((event) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Created on ${event.channelKey}')));
  });*/
}

void _listenNotificationStreamAction(BuildContext context) {
  /*AwesomeNotifications().actionStream.listen((event) {
    if (event.channelKey == 'basic_channel' && Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then((value) {
        AwesomeNotifications().setGlobalBadgeCounter(value - 1);
      });
    }
    switch (event.id) {
      case 1:
        print(event.payload);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => AuctionWonPage(
                payload: event.payload!,
              ),
            ),
            (route) => route.isFirst);
        break;
      case 2:
        print(event.payload);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => AuctionParkingPage(
                payload: event.payload!,
              ),
            ),
            (route) => route.isFirst);
        break;
      default:
    }
  });*/
}

void dispose() {
 // AwesomeNotifications().actionSink.close();
 // AwesomeNotifications().createdSink.close();
}
