// ignore_for_file: constant_identifier_names

class EventMessages {
  const EventMessages._();

  static const GET_REQUEST_FAIL_MESSAGE = "Failed to make a GET request";
  static const POST_REQUEST_FAIL_MESSAGE = "Failed to make a POST request";
  static const PUT_REQUEST_FAIL_MESSAGE = "Failed to make a PUT request";
  static const DELETE_REQUEST_FAIL_MESSAGE = "Failed to make a DELETE request";
  
  static const NETWORK_ERROR_MESSAGE = "Network error occurred";
  static const UNAUTHORIZED_ERROR_MESSAGE = "Unauthorized access, please login";
  static const BAD_REQUEST_ERROR_MESSAGE = "Bad request, please check the data";
  static const SERVER_ERROR_MESSAGE = "Server error, please try again later";
}