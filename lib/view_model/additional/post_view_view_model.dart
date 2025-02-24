

import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/post_user_list_model.dart';
import 'package:mvvm_architecture/repository/post_repo.dart';

import '../../data/response/api_response.dart';
class PostViewViewModel with ChangeNotifier{

  final _myRepo = PostRepo();

  ApiResponse<PostUserListModel> userList = ApiResponse.loading();

  setMoviesList(ApiResponse<PostUserListModel> response){
    userList = response;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());

    _myRepo.postsFetchApi().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, StackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}