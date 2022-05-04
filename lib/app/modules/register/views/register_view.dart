import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: CustomColors.grey400,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 50.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(21, 21, 21, 0.25),
                blurRadius: 10,
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/logo_orange.png",
                  height: 80.w,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  "Get yourself a free acount!",
                  style:
                      TextStyle(color: CustomColors.grey900, fontSize: 20.sp),
                ),
                SizedBox(
                  width: 400.w,
                  child: Divider(
                    height: 40.w,
                  ),
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      hintText: "Firstname Lastname",
                      prefixIcon: Icon(Icons.person_outline),
                      isDense: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return '* Required';
                      } else if (input.isNumericOnly || input.isEmail) {
                        return 'Enter valid name.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      controller.nameController.text = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email-Id"),
                      hintText: "example@email.com",
                      prefixIcon: Icon(Icons.email_outlined),
                      isDense: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return '* Required';
                      } else if (!input.isEmail) {
                        return 'Enter valid e-mail.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      controller.emailController.text = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    controller: controller.phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone no."),
                      prefixText: "+91",
                      prefixIcon: Icon(Icons.call_outlined),
                      isDense: true,
                    ),
                    maxLength: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return '* Required';
                      } else if (!input.isNumericOnly || input.length < 10) {
                        return 'Enter valid phone number.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      controller.phoneController.text = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: Obx(() => TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("Password"),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.obscure1.value =
                                    !controller.obscure1.value;
                              },
                              icon: controller.obscure1.isFalse
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined)),
                          isDense: true,
                        ),
                        obscureText: controller.obscure1.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return '* Required';
                          }
                          return null;
                        },
                        onFieldSubmitted: (val) {
                          controller.passwordController.text = val;
                        },
                      )),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: Obx(() => TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("Confirm password"),
                          prefixIcon: const Icon(Icons.lock_outline),
                          isDense: true,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.obscure2.value =
                                    !controller.obscure2.value;
                              },
                              icon: controller.obscure2.isFalse
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined)),
                        ),
                        obscureText: controller.obscure2.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) {
                          if (input == null || input.isEmpty) {
                            return '* Required';
                          } else if (input !=
                              controller.passwordController.text) {
                            return 'Password did not match.';
                          }
                          return null;
                        },
                      )),
                ),
                SizedBox(
                  height: 20.w,
                ),
                // Obx(() => SizedBox(
                //       width: 400.w,
                //       child: ListTile(
                //         leading: Checkbox(
                //           value: checked.value,
                //           onChanged: (isChecked) {
                //             checked.value = isChecked!;
                //           },
                //         ),
                //         title: RichText(
                //           text: TextSpan(
                //             text: "I agree to all ",
                //             children: [
                //               TextSpan(
                //                 text: "Terms & Conditions",
                //                 style: TextStyle(color: CustomColors.orange),
                //               ),
                //             ],
                //           ),
                //         ),
                //         dense: true,
                //         style: ListTileStyle.drawer,
                //       ),
                //     )),
                // SizedBox(
                //   height: 20.w,
                // ),
                Obx(() => SizedBox(
                  width: 400.w,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.registerUser();
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
                        : const Text("Create Account"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColors.grey700),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(28.w)),
                    ),
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
