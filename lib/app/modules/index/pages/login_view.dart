import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/index/controller/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //attaching controller
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: CustomColors.grey200,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(48.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "User Login",
                  style: TextStyle(fontSize: 24.sp),
                ),
                SizedBox(
                  width: 360.w,
                  child: Divider(
                    height: 24.w,
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.error.value,
                    child: Container(
                      width: 360.w,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Invalid phone number or password.\nPlease enter correct details.",
                        style: TextStyle(color: Colors.red.shade600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.w,
                ),
                SizedBox(
                  width: 360.w,
                  child: TextFormField(
                    controller: controller.phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone no."),
                      prefixText: "+91",
                      prefixIcon: Icon(Icons.call_outlined),
                    ),
                    maxLength: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return '* Required';
                      } else if (!input.isNumericOnly || input.length < 10) {
                        return 'Please enter valid number.';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      controller.phoneController.text = val!;
                    },
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                SizedBox(
                  width: 360.w,
                  child: Obx(() => TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text("Password"),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.obscure.value =
                                      !controller.obscure.value;
                                },
                                icon: controller.obscure.isFalse
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(
                                        Icons.visibility_off_outlined))),
                        obscureText: controller.obscure.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (val) {
                          controller.passwordController.text = val!;
                        },
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return '* Required';
                          }
                          return null;
                        },
                      )),
                ),
                SizedBox(
                  height: 24.w,
                ),
                Obx(
                  () => SizedBox(
                    width: 360.w,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.userLogin();
                        }
                      },
                      child: controller.isLoading.value
                          ? SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Login"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.orange),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(24.w)),
                      ),
                    ),
                  ),
                ),
                Obx(() => Visibility(
                      visible: controller.isLoading.isFalse,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 24.w,
                          ),
                          SizedBox(
                            width: 360.w,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "OR",
                                  style: TextStyle(color: CustomColors.grey700),
                                )),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          SizedBox(
                            width: 360.w,
                            child: OutlinedButton(
                              onPressed: () {
                                controller.goToRegister();
                              },
                              child: const Text("Create Account"),
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(
                                    CustomColors.orange),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(24.w)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
