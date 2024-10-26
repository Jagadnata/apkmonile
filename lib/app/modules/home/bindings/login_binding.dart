import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/login_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
