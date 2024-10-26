import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/profile_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
