import 'package:get/get.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var nim = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  void setProfile(String newName, String newNim, String newEmail, String newPhone) {
    name.value = newName;
    nim.value = newNim;
    email.value = newEmail;
    phone.value = newPhone;
  }
}
