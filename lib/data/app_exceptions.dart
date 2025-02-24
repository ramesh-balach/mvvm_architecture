// Base class for all custom exceptions in the application
class AppExceptions implements Exception {
  final _message; // The specific error message
  final _prefix; // A prefix to provide context to the error

  // Constructor that initializes the error message and prefix
  AppExceptions([this._message, this._prefix]);

  // Override toString to display a readable error message
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

// Exception for errors that occur during communication with a server
class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

// Exception for bad requests, e.g., invalid client requests
class BadRequestException extends AppExceptions {
  BadRequestException([String? message])
      : super(message, 'Invalid Request: ');
}

// Exception for unauthorized access, e.g., invalid credentials
class UnauthorizedRequestException extends AppExceptions {
  UnauthorizedRequestException([String? message])
      : super(message, 'Unauthorized Request: ');
}

// Exception for invalid input, e.g., when the user submits invalid data
class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input: ');
}

// Exception for forbidden actions, e.g., when the server denies access
class ForbiddenException extends AppExceptions {
  ForbiddenException([String? message])
      : super(message, 'Forbidden Request: ');
}

// Exception for when a resource is not found, e.g., 404 errors
class NotFoundException extends AppExceptions {
  NotFoundException([String? message])
      : super(message, 'Resource Not Found: ');
}

// Exception for server-side errors, e.g., 500 Internal Server Error
class InternalServerErrorException extends AppExceptions {
  InternalServerErrorException([String? message])
      : super(message, 'Internal Server Error: ');
}

// Exception for when the service is unavailable, e.g., server downtime
class ServiceUnavailableException extends AppExceptions {
  ServiceUnavailableException([String? message])
      : super(message, 'Service Unavailable: ');
}

// Exception for request timeouts, e.g., when a request takes too long to respond
class TimeoutException extends AppExceptions {
  TimeoutException([String? message])
      : super(message, 'Request Timeout: ');
}

// Exception for data conflicts, e.g., duplicate records
class ConflictException extends AppExceptions {
  ConflictException([String? message])
      : super(message, 'Data Conflict: ');
}

// Generic exception for errors that don't fit into other categories
class UnknownException extends AppExceptions {
  UnknownException([String? message])
      : super(message, 'Unknown Error: ');
}

// Exception for when there is no internet connection
class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection: ');
}
