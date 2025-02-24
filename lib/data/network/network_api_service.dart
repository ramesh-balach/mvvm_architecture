import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app_exceptions.dart';
import 'base_api_service.dart';

class NetworkApiService implements BaseApiServices {

  // Method to handle GET requests
  @override
  Future<dynamic> getApiResponse(String url) async {
    logDebugInfo('GET Request URL: $url');
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No internet connection. Please check your connection.');
    } on TimeoutException {
      throw FetchDataException('Request timed out. Please try again.');
    }

    logDebugInfo('GET Response: $responseJson');
    return responseJson;
  }

  // Method to handle POST requests
  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    logDebugInfo('POST Request URL: $url');
    logDebugInfo('POST Request Body: $data');
    dynamic responseJson;

    try {
      Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No internet connection. Please check your connection.');
    } on TimeoutException {
      throw FetchDataException('Request timed out. Please try again.');
    }

    logDebugInfo('POST Response: $responseJson');
    return responseJson;
  }

  // Method to handle PUT requests (update)
  Future<dynamic> updateApiResponse(String url, dynamic data) async {
    logDebugInfo('PUT Request URL: $url');
    logDebugInfo('PUT Request Body: $data');
    dynamic responseJson;

    try {
      Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No internet connection. Please check your connection.');
    } on TimeoutException {
      throw FetchDataException('Request timed out. Please try again.');
    }

    logDebugInfo('PUT Response: $responseJson');
    return responseJson;
  }

  // Method to handle DELETE requests
  Future<dynamic> deleteApiResponse(String url) async {
    logDebugInfo('DELETE Request URL: $url');
    dynamic responseJson;

    try {
      Response response = await http.delete(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No internet connection. Please check your connection.');
    } on TimeoutException {
      throw FetchDataException('Request timed out. Please try again.');
    }

    logDebugInfo('DELETE Response: $responseJson');
    return responseJson;
  }

  // Method to handle and parse HTTP responses
  dynamic returnResponse(http.Response response) {
    logDebugInfo('Response Status Code: ${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      case 201:
      // Resource created successfully
        return jsonDecode(response.body);

      case 400:
        throw BadRequestException('Bad Request: ${response.body}');

      case 401:
      case 403:
        throw UnauthorizedRequestException('Unauthorized Access: ${response.body}');

      case 404:
        throw NotFoundException('Resource not found: ${response.body}');

      case 500:
      case 503:
        throw InternalServerErrorException('Server Error: ${response.body}');

      default:
        throw FetchDataException('Error occurred: Status Code ${response.statusCode}');
    }
  }

  // Utility method for logging debug information
  void logDebugInfo(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
