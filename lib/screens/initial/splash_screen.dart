import 'package:flutter/material.dart';
import 'package:layout/services/routes.dart';

import '../../resources/constants.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(Duration(seconds: 3), () {
      bool? isUserLoggedIn = prefs.getBool(isLoggedIn)??false;
      if(isUserLoggedIn) {
        Navigator.of(context).pushReplacementNamed(RouteId.homeScreen);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteId.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit, size: 50, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
