import 'dart:convert';
import 'package:auditplus/app/values/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../customs/custom_colors.dart';
// import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  // implement controller
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs, error = false.obs, obscure = true.obs;

  void userLogin() async {
    try {
      isLoading.value = true;
      var url = "${Urls.baseUrl}${Urls.login}";
      var body = {
        'phone_no': phoneController.text,
        'password': passwordController.text
      };
      var response = await http.post(Uri.parse(url), body: jsonEncode(body));
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        var userData = result['data'];
        Get.showSnackbar(GetSnackBar(
          snackPosition: SnackPosition.TOP,
          titleText: Text("Login Successful." , style: TextStyle(color: CustomColors.grey900),),
          messageText: Text("Hang tight! We are launching the app.", style: TextStyle(color: CustomColors.grey900),),
          icon: Icon(Icons.check, color: CustomColors.grey600,),
          backgroundColor: CustomColors.grey100,
          duration: const Duration(seconds: 1),
        ));
        goToHome(userData);
      } else {
        error.value = true;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  void goToHome(args) {
    Get.offAllNamed('/home',arguments: args);
  }
}

class DashboardController extends GetxController {
  // implement controller

}

