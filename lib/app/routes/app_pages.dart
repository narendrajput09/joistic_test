
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:joistic_test/app/modules/home_screen/binding/home_screen_binding.dart';
import 'package:joistic_test/app/modules/home_screen/view/home_screen.dart';
import 'package:joistic_test/app/modules/login_screen/binding/login_screen_binding.dart';
import 'package:joistic_test/app/modules/login_screen/view/login_screen.dart';
import 'package:joistic_test/app/routes/app_routes.dart';



class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => LoginScreen(),
        binding: LoginScreenBinding()),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => HomeScreen(),
        binding: HomeScreenBinding()),


  ];
}
