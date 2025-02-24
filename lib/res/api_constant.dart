class ApiConstant{

  //Base Url
  static const String baseUrl = 'https://reqres.in/';

  //Movies List Base Url
  static const String moviesBaseUrl = 'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io';

  //Login url
  static const String loginUrl = baseUrl+'api/login';

  //SignUp url
  static const String signUpUrl = baseUrl+'api/register';

  //Movie List End Point
  static const String moviesListEndPoint = moviesBaseUrl+'/movies_list';

  //Fetch user list End Point
  static const String userListEndPoint = baseUrl + 'api/users?page=2';

}