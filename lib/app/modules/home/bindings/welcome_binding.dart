import 'package:get/get.dart';
import 'package:myapp/app/modules/home/controllers/welcome_controller.dart';


class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
