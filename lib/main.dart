import 'package:flutter/material.dart';
import 'package:shoe_store/routes/app_route_config.dart';
import 'package:shoe_store/screen/SignIn.dart';
import 'package:shoe_store/screen/loginDemo.dart';
import 'package:shoe_store/screen/Splash.dart';
import 'package:shoe_store/screen/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter.returnRouter(false).routeInformationParser,
      routerDelegate: MyAppRouter.returnRouter(false).routerDelegate,
    );
  }
}

