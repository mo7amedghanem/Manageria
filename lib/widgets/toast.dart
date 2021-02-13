import 'package:toast/toast.dart';
class ShowToast {
  static showDialog(String message, context){
    Toast.show(
        message,
        context,
        duration : Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM
    );
  }
}