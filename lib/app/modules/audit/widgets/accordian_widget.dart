import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../../customs/custom_colors.dart';

class Accordian extends StatelessWidget {
  final RxBool expanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.grey100,
      elevation: 2,
      semanticContainer: false,
      child: SizedBox(
        width: 1.sw,
        //padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  const Text("Question Topic"),
                  SizedBox(
                    width: 40.w,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: LinearProgressIndicator(
                      value: 0.25,
                      semanticsLabel: "25%",
                      backgroundColor: CustomColors.grey200,
                      color: CustomColors.grey600,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const Text("25 %"),
                  //Spacer(),
                ],
              ),
              style: ListTileStyle.list,
              trailing: Obx(
                () => IconButton(
                    onPressed: () {
                      expanded.value = !expanded.value;
                    },
                    icon: expanded.isTrue
                        ? const Icon(Icons.arrow_drop_up_outlined)
                        : const Icon(Icons.arrow_drop_down_outlined)),
              ),
            ),
            Obx(
              () => Visibility(
                visible: expanded.value,
                child: Container(
                  //height: 100.w,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: CustomColors.grey100,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomColors.grey200,width: 2.0),
                  ),
                  //TODO : Listview is rebuild everytime the accordian is expanded, fix it with data structure
                  child: ListView.builder(
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
                    itemBuilder: (context, index) => SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Q.${index + 1} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          style: TextStyle(fontWeight: FontWeight.w500, color: CustomColors.grey900),
                          ),
                          AnswerRadios(),
                          SizedBox(
                            height: 12.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerRadios extends StatelessWidget {
  final List<String> answer = ["Yes", "No", "NA"];
  final RxString option = "".obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        child: RadioGroup<String>.builder(
          direction: Axis.horizontal,
          activeColor: CustomColors.orange,
          horizontalAlignment: MainAxisAlignment.start,
          spacebetween: 60.w,
          groupValue: option.value,
          onChanged: (value) {
            option.value = value!;
            print(option);
          },
          items: answer,
          itemBuilder: (item) => RadioButtonBuilder(item),
        ),
      ),
    );
  }
}
