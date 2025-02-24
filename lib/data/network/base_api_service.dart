abstract class BaseApiServices {

  // Method to handle GET requests
  Future<dynamic> getApiResponse(String url);

  // Method to handle POST requests
  Future<dynamic> postApiResponse(String url, dynamic data);

  // Method to handle PUT requests (update)
  Future<dynamic> updateApiResponse(String url, dynamic data);

  // Method to handle DELETE requests
  Future<dynamic> deleteApiResponse(String url);
}
