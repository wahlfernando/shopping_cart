import 'package:get/get.dart';

import 'home_controller.dart';

class AlterarIdiomaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
