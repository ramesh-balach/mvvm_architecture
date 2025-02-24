
import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/repository/auth_repo.dart';
import 'package:mvvm_architecture/routes/app_routes.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../view/login_view.dart';

class AuthViewModel extends ChangeNotifier{

  bool _isLoginLoading = false;
  bool get isLoginLoading => _isLoginLoading;

  setLoginLoading(bool val){
    _isLoginLoading = val;
    notifyListeners();
  }

  bool _isSignUpLoading = false;
  bool get isSignUpLoading => _isSignUpLoading;

  setSignUpLoading(bool val){
    _isSignUpLoading = val;
    notifyListeners();
  }



  final _authRepo = AuthRepo();

  Future<void> loginApi(dynamic data, context) async{
    setLoginLoading(true);
    await _authRepo.loginApi(data).then((onValue){

      print('this is value $onValue');
      final provider = Provider.of<UserViewModel>(context, listen: false);
      provider.saveUser(UserModel.fromJson(onValue));
      Navigator.pushNamed(context, AppRoutes.homeView);

      setLoginLoading(false);
      Utils.showSuccessToast('Successful Login');
    }).onError((error, StackTrace){
      setLoginLoading(false);
      Utils.showErrorToast(error.toString());
    });
  }




  Future<void> signUpApi(dynamic data, context) async{
    setSignUpLoading(true);
    await _authRepo.loginApi(data).then((onValue){
      Navigator.pushNamed(context, AppRoutes.loginView);
      setSignUpLoading(false);
      Utils.showSuccessToast('Successful SignUp');
    }).onError((error, StackTrace){
      setSignUpLoading(false);
      Utils.showErrorToast(error.toString());
    });
  }


   }