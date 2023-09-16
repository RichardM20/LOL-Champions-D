import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lol_app/app/utils/font_app.dart';
import 'package:lol_app/app/utils/music.dart';
import 'package:lol_app/presentation/widgets/scale_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Music.playBackgroundMusic();
    checkInternetConnectivity(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleAnimationWidget(
            widget: Image.asset('assets/img/splash-icon.png'),
            duration: 1000,
          ),
          ScaleAnimationWidget(
            widget: Text(
              "Developed by Rick Dev",
              style: TextStyle(
                fontFamily: FontFamilyApp.bold,
              ),
            ),
            duration: 1500,
          ),
        ],
      ),
    );
  }

  Future<void> checkInternetConnectivity(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Future.delayed(const Duration(milliseconds: 2000), () {
          GoRouter.of(context).replace('/home-page');
        });
      }
    } on SocketException catch (_) {
      const ScaffoldMessenger(
        child: Text("No internet conection"),
      );
      await Future.delayed(const Duration(seconds: 1));
      exit(0);
    }
  }
}
