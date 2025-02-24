import 'dart:convert';

import 'package:mvvm_architecture/data/network/base_api_service.dart';
import 'package:mvvm_architecture/data/network/network_api_service.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/res/api_constant.dart';

class HomeRepo {
  BaseApiServices _myRepo = NetworkApiService();

  Future<dynamic> moviesFetchDataApi() async {
    final response =
        await _myRepo.getApiResponse(ApiConstant.moviesListEndPoint);
    // print('\nThis is Home Repo Data : ${jsonDecode(response) as Map<String, dynamic>}');
    return MoviesListModel.fromJson(response);
  }
}
