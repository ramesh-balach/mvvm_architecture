import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/custom_text_widget.dart';
import 'package:mvvm_architecture/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().checkUserLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomTextWidget(
          text: 'Splash Screen',
          fontSize: 40,
        ),
      ),
    );
  }
}
