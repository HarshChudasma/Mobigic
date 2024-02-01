import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    3.delay(
      () => Get.offAllNamed(Routes.NUMBER_SCREEN),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText(
              'Mobigic',
              duration: const Duration(seconds: 2),
              textStyle: context.textTheme.labelSmall?.copyWith(fontSize: 26.0),
            ),
          ],
        ),
      ),
    );
  }
}
