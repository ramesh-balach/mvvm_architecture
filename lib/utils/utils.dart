import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  //Method to calculate Average Ratings
  static double calculateAverage(List<int> rating){
    var avgRating = 0;
    for(int i = 0; i< rating.length; i++){
        avgRating = avgRating + rating[i];
    }
    print('Done');
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }

  //Change focus node
  static void changeFocusNode(BuildContext context, currentFocusNode, nextFocusNode){
    currentFocusNode.unfocus;
    FocusScope.of(context).requestFocus(nextFocusNode);

  }

  //Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }


  // Show a simple toast message
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    int duration = 2,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration == 1 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: duration,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  // Show success message with a specific style
  static void showSuccessToast(String message, {int duration = 2}) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
      duration: duration,
    );
  }

  // Show error message with a specific style
  static void showErrorToast(String message, {int duration = 2}) {
    showToast(
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      duration: duration,
    );
  }

  // Show info message with a specific style
  static void showInfoToast(String message, {int duration = 2}) {
    showToast(
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
      duration: duration,
    );
  }

  // Show warning message with a specific style
  static void showWarningToast(String message, {int duration = 2}) {
    showToast(
      message: message,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0,
      duration: duration,
    );
  }
}
