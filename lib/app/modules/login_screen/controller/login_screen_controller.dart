
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joistic_test/app/routes/app_routes.dart';
import 'package:joistic_test/utils/app_preference.dart';

class LoginScreenController extends GetxController {

var isLoading = false.obs;

//Google signin

  Future<dynamic> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        AppPreference().set(user.displayName??"", AppPreference.KEY_USER_NAME);
        AppPreference().set(user.email??"", AppPreference.KEY_USER_EMAIL);
        AppPreference().set( user.uid??"", AppPreference.KEY_USER_ID);

      }
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.homeScreen);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }


}