import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/audit/widgets/accordian_widget.dart';
import 'package:auditplus/app/modules/report/report_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormView extends StatelessWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.grey800,
        title: Row(
          children: [
            const Text(
              "Educational",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: const Icon(
                Icons.school_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: CustomColors.grey300,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: CustomColors.grey100,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 40.w,
                runSpacing: 20.w,
                children: [
                  SizedBox(
                    width: 300.w,
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text("Audit No."),
                        border: const OutlineInputBorder(),
                        focusColor: CustomColors.grey800,
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (val) {
                        print(val);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text("Company ID"),
                        border: const OutlineInputBorder(),
                        focusColor: CustomColors.grey800,
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (val) {
                        print(val);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text("Company Name"),
                        border: const OutlineInputBorder(),
                        focusColor: CustomColors.grey800,
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (val) {
                        print(val);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text("Date"),
                        border: const OutlineInputBorder(),
                        focusColor: CustomColors.grey800,
                      ),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      initialValue: DateTime.now().toString(),
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text("Schedule"),
                        border: const OutlineInputBorder(),
                        focusColor: CustomColors.grey800,
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      keyboardType: TextInputType.number,
                      // onTap: () async {
                      //   await showDatePicker(
                      //       context: context,
                      //       initialDate: DateTime.now(),
                      //       firstDate: DateTime(2022),
                      //       lastDate: DateTime(2022));
                      // },
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.w,
            ),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            Accordian(),
            SizedBox(
              height: 24.w,
            ),
            Container(
              width: 1.sw,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: CustomColors.grey100,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Audit Review / Feedback :",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Write something...",
                      ),
                      onSubmitted: (val) {
                        print(val);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(ReportView());
                },
                child: const Text("Generate Report"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(CustomColors.grey800),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(24.w)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
