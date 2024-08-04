import 'package:get/get.dart';
import 'package:joistic_test/app/modules/home_screen/controller/home_screen_controller.dart';


class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}