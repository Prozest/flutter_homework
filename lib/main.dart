import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/app/app_routes.dart';
import 'package:flutter_homework/component/loading.dart';
import 'package:flutter_homework/component/snackbar.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Loading(
      child: GetMaterialApp(
        initialRoute: "/",
        scaffoldMessengerKey: SnackBarWidget.messengerKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        getPages: AppRoutes.routes,
      ),
    );
  }
}