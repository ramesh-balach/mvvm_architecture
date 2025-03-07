import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/app_colors.dart';
import 'package:mvvm_architecture/routes/app_routes.dart';
import 'package:mvvm_architecture/view/login_view.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:mvvm_architecture/view_model/home_view_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splashView,
        onGenerateRoute: AppRoutes.generateRoute,
        home: const LoginView(),
      ),
    );
  }
}
