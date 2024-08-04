import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joistic_test/app/routes/app_routes.dart';
import 'package:joistic_test/networking/models/company_list_response/company_list_response.dart';
import 'package:joistic_test/networking/rest_api_client.dart';
import 'package:joistic_test/utils/app_preference.dart';
import 'package:joistic_test/utils/my_dialog.dart';
import 'package:joistic_test/utils/my_snackbar.dart';

class HomeScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var isLoading = false.obs;
  RxList<CompanyListResponse> getCompanyList = <CompanyListResponse>[].obs;
  RxList<CompanyListResponse> filteredList = <CompanyListResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCompanyListAPI();
    searchController.addListener(onSearchChanged);
  }

  // Company list api
  Future<void> getCompanyListAPI() async {
    var client = RestApiClient();
    isLoading.value = true;
    await client.getCompanyList().then((value) {
      isLoading.value = false;

      if (value != null) {
        for (int i = 0; i < value.length; i++) {
          CompanyListResponse responce = CompanyListResponse(
              albumId: value[i].albumId,
              id: value[i].id,
              isApplied: false,
              thumbnailUrl: value[i].thumbnailUrl,
              title: value[i].title,
              url: value[i].url);
          getCompanyList.add(responce);
        }
        filterList(searchController.text);
      }
    }).onError((error, stackTrace) {
      if (error is DioException) {
        var err = error;
        MySnackBar.error(err.message);
        isLoading.value = false;
      } else {
        MySnackBar.error(error.toString());
        isLoading.value = false;
      }
    });
  }

  // For filter list
  void onSearchChanged() {
    String query = searchController.text;
    filterList(query);
  }

  void filterList(String searchText) {
    if (searchText.isEmpty) {
      filteredList.clear(); // Use clear() instead of setting to null
    } else {
      filteredList.value = getCompanyList
          .where((item) => (item.title ?? '')
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    }
  }

  Future<void> signOut() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      AppPreference().clearAll();
      Get.offAllNamed(AppRoutes.loginScreen);
      print('User signed out successfully.');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void showCompanyDialog(context, int index) {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'ShowGeneralDialog',
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (context, _, __) {
          return GetBuilder<HomeScreenController>(
            builder: (controller) {
              return CompanyDetailDialog(
                applyClick: () {
                  if (controller.filteredList.isNotEmpty && controller.filteredList[index].isApplied == false ||
                      controller.getCompanyList[index].isApplied == false) {
                    controller.filteredList.isNotEmpty ||
                            controller.searchController.text.isNotEmpty
                        ? controller.filteredList[index].isApplied = true
                        : controller.getCompanyList[index].isApplied = true;
                    update();
                    MySnackBar.success("Job Applied!");
                  }
                },
                items: controller.filteredList.isNotEmpty ||
                        controller.searchController.text.isNotEmpty
                    ? controller.filteredList[index]
                    : controller.getCompanyList[index],
              );
            },
          );
        },
        transitionBuilder: (_, animation1, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation1),
            child: child,
          );
        });
  }
}
