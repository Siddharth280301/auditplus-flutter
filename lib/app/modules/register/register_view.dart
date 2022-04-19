import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  final RxBool checked = false.obs;

  @override
  Widget build(BuildContext context) {
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
            autovalidateMode: AutovalidateMode.disabled,
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      prefixIcon: Icon(Icons.person_outline),
                      isDense: true,
                    ),
                    onSaved: (val) {
                      print(val);
                    },
                    validator: (input) {
                      return input == null || input.isEmpty
                          ? 'Please enter valid name.'
                          : null;
                    },
                    onFieldSubmitted: (val) {
                      print(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email-Id"),
                      prefixIcon: Icon(Icons.email_outlined),
                      isDense: true,
                    ),
                    onSaved: (val) {
                      print(val);
                    },
                    validator: (input) {
                      if (input == null ||
                          input.isEmpty ||
                          !input.contains("@")) {
                        return 'Please enter valid email.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      print(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone no."),
                      prefixText: "+91",
                      prefixIcon: Icon(Icons.call_outlined),
                      isDense: true,
                    ),
                    onSaved: (val) {
                      print(val);
                    },
                    maxLength: 10,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter valid number.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      print(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock_outline),
                      isDense: true,
                    ),
                    obscureText: true,
                    onSaved: (val) {
                      print(val);
                    },
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter valid password.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      print(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: 400.w,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Confirm password"),
                      prefixIcon: Icon(Icons.lock_outline),
                      isDense: true,
                    ),
                    onSaved: (val) {
                      print(val);
                    },
                    obscureText: true,
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please enter valid password.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (val) {
                      print(val);
                    },
                  ),
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
                SizedBox(
                  width: 400.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(const HomeView());
                    },
                    child: const Text("Create Account"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColors.grey700),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(28.w)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
