import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/network/notification_service/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize firebase from firebase core plugin
  await Firebase.initializeApp();
  NotificationService().initNotification();

  runApp(const MyApp());
}
