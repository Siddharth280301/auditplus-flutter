import 'dart:convert';
import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/values/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController{
  RxBool obscure1 = true.obs , obscure2 = true.obs, isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser() async {
    try{
      isLoading.value = true;
      var name = nameController.text.split(' ');
      var firstname = name[0];
      var lastname = name[1];
      var url = "${Urls.baseUrl}${Urls.register}";
      var data = {
        "firstname" : firstname,
        "lastname" : lastname,
        "email_id" : emailController.text,
        "phone_no" : phoneController.text,
        "password" : passwordController.text
      };
      var response = await http.post(Uri.parse(url),body: jsonEncode(data));
      if(response.statusCode == 200){
        Get.showSnackbar(GetSnackBar(
          snackPosition: SnackPosition.TOP,
          title: "Register Successful.",
          message: "Hang tight! We are launching the app.",
          icon: Icon(Icons.person_add_alt, color: CustomColors.grey600,),
          backgroundColor: CustomColors.grey100,
          duration: const Duration(seconds: 2),
        ));
        login(phoneController.text, passwordController.text);
      } else {
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        phoneController.clear();
      }
      isLoading.value = false;
    } catch(e) {
      isLoading.value = false;
      print(e);
    }
  }

  void login(phoneNo,password) async {
    isLoading.value = true;
    var url = "${Urls.baseUrl}${Urls.login}";
    var body = {
      'phone_no': phoneNo,
      'password': password
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(body));
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      var userData = result['data'];
      goToHome(userData);
    }
    isLoading.value = false;
  }

  void goToHome(args) {
    Get.offAllNamed('/home',arguments: args);
  }
}