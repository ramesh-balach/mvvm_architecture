import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/custom_text_widget.dart';
import 'package:mvvm_architecture/view/additional/post_view.dart';

import '../view/home_view.dart';
import '../view/login_view.dart';
import '../view/singup_view.dart';
import '../view/splash_view.dart';

class AppRoutes {
  // routes name
  static const String splashView = 'splashView';
  static const String loginView = 'loginView';
  static const String homeView = 'homeView';
  static const String signUpView = 'signUpView';
  static const String postView = 'postView';

  // routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );
      case loginView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );
      case homeView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );
      case signUpView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView(),
        );
      case postView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const PostView(),
        );
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: CustomTextWidget(text: 'No Screen Found'),
                  ),
                ));
    }
  }
}
