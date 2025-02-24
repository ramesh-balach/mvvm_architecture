import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/routes/app_routes.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';

class SplashServices{

  Future<UserModel> getUserData()=> UserViewModel().getUser();
  Future checkUserLogin(BuildContext context) async{
    getUserData().then((onValue){
      if(onValue.token == 'null' || onValue.token == ''){
        Future.delayed(Duration(seconds: 3)).then((value){
          Navigator.pushNamed(context, AppRoutes.loginView);
        });
      }else{
        Future.delayed(Duration(seconds: 3)).then((value){
          Navigator.pushNamed(context, AppRoutes.homeView);
        });
      }
    });
  }
}