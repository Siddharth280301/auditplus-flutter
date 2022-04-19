import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/home/home_view.dart';
import 'package:auditplus/app/modules/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                height: 24.w,
              ),
              SizedBox(
                width: 360.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Phone no."),
                    prefixText: "+91",
                    prefixIcon: Icon(Icons.call_outlined),
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
                height: 12.w,
              ),
              SizedBox(
                width: 360.w,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.lock_outline),
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
                height: 24.w,
              ),
              SizedBox(
                width: 360.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const HomeView());
                  },
                  child: const Text("Login"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(CustomColors.orange),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
                  ),
                ),
              ),
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
                    Get.to(RegisterView());
                  },
                  child: const Text("Create Account"),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(CustomColors.orange),
                    padding: MaterialStateProperty.all(EdgeInsets.all(24.w)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
