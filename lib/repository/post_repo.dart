
import 'package:mvvm_architecture/data/network/base_api_service.dart';
import 'package:mvvm_architecture/data/network/network_api_service.dart';
import 'package:mvvm_architecture/models/post_user_list_model.dart';
import 'package:mvvm_architecture/res/api_constant.dart';

class PostRepo{
  
  BaseApiServices postRepo = NetworkApiService();
  
  Future<dynamic> postsFetchApi() async{
    try{
     dynamic response =  await postRepo.getApiResponse(ApiConstant.userListEndPoint);
     return PostUserListModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}