import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:shoe_store/routes/app_route_constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async{
    await Future.delayed(const Duration(seconds: 3)); // Chờ 3 giây
    // ignore: use_build_context_synchronously
    GoRouter.of(context).pushNamed(MyAppRouteConstants.signInRouteName);
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: const Color(0xFF40BFFF),
      body: Center(
        child: _icon(),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
        color: Colors.white,
      ),
      width: 72,
      height: 72,
      child: Image.asset(
        'lib/assets/icon/icon1.png',
        width: 32,
        height: 32,
      ),
    );
  }
}
