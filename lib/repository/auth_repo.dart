
import 'package:mvvm_architecture/data/network/base_api_service.dart';
import 'package:mvvm_architecture/data/network/network_api_service.dart';
import 'package:mvvm_architecture/res/api_constant.dart';

class AuthRepo{

  BaseApiServices _myRepo = NetworkApiService();


  //Method to handle LoginApi
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _myRepo.postApiResponse(ApiConstant.loginUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }



  //Method to handle SignUp
  Future<dynamic> signUpApi(dynamic data) async{
    try{
      dynamic response = await _myRepo.postApiResponse(ApiConstant.signUpUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }
}