import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic_test/app/modules/login_screen/controller/login_screen_controller.dart';
import 'package:joistic_test/l10n/localization.dart';
import 'package:joistic_test/src/gen/assets.gen.dart';
import 'package:joistic_test/src/gen/colors.gen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.white,
      body:

      SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Login text
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.09),
            child: Text(
              AppLocalizations.of(context)!.heyThere,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.welcome,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          //Login image
          Image.asset(Assets.images.imgLogin.path),

          //Sign in button

          Obx(
            () => SignInButton(
              isLoading: controller.isLoading.value,
              onButtonTap: () {
                // Get.toNamed(AppRoutes.homeScreen);
                controller.signInWithGoogle();
              },
            ),
          )
        ],
      )),
    );
  }
}

class SignInButton extends StatelessWidget {
  final Function onButtonTap;
  final bool? isLoading;

  SignInButton({super.key, required this.onButtonTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLoading!) {
          onButtonTap();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 1, color: ColorName.textColor)),
        child: isLoading!
            ? const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: ColorName.primary,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.icGoogle.path,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.signInWithGoogle,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18),
                  )
                ],
              ),
      ),
    );
  }
}

