import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var _uid = "".obs;
  String get uid => _uid.value;
  setUid(String val) {
    _uid.value = val;
  }
}
