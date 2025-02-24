import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/data/response/api_response.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/repository/home_repo.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myRepo = HomeRepo();

  ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModel> response){
    moviesList = response;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());

    _myRepo.moviesFetchDataApi().then((value){
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, StackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }

}