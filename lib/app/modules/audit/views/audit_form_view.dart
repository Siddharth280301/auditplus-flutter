import 'package:auditplus/app/customs/custom_colors.dart';
import 'package:auditplus/app/modules/audit/controller/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import '../models/subtopic_model.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  final controller = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.grey800,
        title: Row(
          children: [
            Text(
              "${controller.arguments['sectorName'] ?? " "}",
              style: const TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Icon(
                controller.arguments['sectorIcon'],
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
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: SizedBox(
                width: 64.w,
                height: 64.w,
                child: CircularProgressIndicator(
                  color: CustomColors.grey700,
                ),
              ),
            )
          : SingleChildScrollView(
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
                            onChanged: (val) {
                              controller.auditNo = val;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 300.w,
                          child: TextField(
                            decoration: InputDecoration(
                              label: const Text("Department ID"),
                              border: const OutlineInputBorder(),
                              focusColor: CustomColors.grey800,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              controller.deptId = val;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 300.w,
                          child: TextField(
                            decoration: InputDecoration(
                              label: const Text("Department Name"),
                              border: const OutlineInputBorder(),
                              focusColor: CustomColors.grey800,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              controller.deptName = val;
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
                            controller: controller.scheduleController,
                            decoration: InputDecoration(
                              hintText: "Schedule",
                              border: const OutlineInputBorder(),
                              focusColor: CustomColors.grey800,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            keyboardType: TextInputType.number,
                            onTap: () async {
                              var schedule = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022, 1, 1),
                                  lastDate: DateTime(2022, 12, 31));
                              if (schedule != null) {
                                controller.scheduleController.text =
                                    schedule.toString();
                              }
                            },
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.file_upload),
                            label: const Text("Add Images"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.grey600),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(24.w)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Obx(
                    () => controller.topics.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.topics.length,
                            itemBuilder: (context, index) => getAccordian(
                                context, controller.topics[index], index),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                "No topics found to survey. Add some topics from below.",
                                style: TextStyle(
                                    color: CustomColors.grey900,
                                    fontSize: 20.sp),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.addSubTopic(context);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add New Topic"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.grey100),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(24.w)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
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
                            onChanged: (val) {
                              controller.feedback = val;
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
                        controller.checkAll();
                      },
                      child: const Text("Generate Report"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColors.grey800),
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
            )),
    );
  }

  Widget getAccordian(
      BuildContext context, SubtopicModel subtopicModel, int topicIndex) {
    final RxBool expanded = false.obs;
    //final RxInt marked = 0.obs;

    return Card(
      color: CustomColors.grey100,
      elevation: 2,
      semanticContainer: false,
      margin: EdgeInsets.only(bottom: 24.w),
      child: SizedBox(
        width: 1.sw,
        //padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            ListTile(
              title: Text(subtopicModel.topicName),
              // Obx(() => Row(
              //       children: [
              //         subtopicModel.questionsList!.isEmpty
              //             ? const SizedBox()
              //             : Row(
              //                 children: [
              //                   SizedBox(
              //                     width: 40.w,
              //                   ),
              //                   SizedBox(
              //                     width: 200.w,
              //                     child: LinearProgressIndicator(
              //                       value: (marked.value /
              //                               subtopicModel
              //                                   .questionsList!.length) *
              //                           100,
              //                       backgroundColor: CustomColors.grey200,
              //                       color: CustomColors.grey600,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: 20.w,
              //                   ),
              //                   Text(
              //                       "${(marked.value / subtopicModel.questionsList!.length) * 100} %"),
              //                 ],
              //               ),
              //         Spacer(),
              //       ],
              //     )),
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
            Obx(() => Visibility(
                  visible: expanded.value,
                  child: Container(
                    //height: 100.w,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: CustomColors.grey100,
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: CustomColors.grey200, width: 2.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              controller.addQuestion(
                                  context, subtopicModel.topicName, topicIndex);
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("Add Question"),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(16.w)),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Obx(
                          () => subtopicModel.questionsList!.isNotEmpty
                              ? ListView.separated(
                                  itemCount:
                                      subtopicModel.questionsList!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 12.w),
                                  itemBuilder: (context, index) => ListTile(
                                    title: Text(
                                      "Q. ${subtopicModel.questionsList![index].question}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.grey900),
                                    ),
                                    hoverColor: Colors.blue.shade50,
                                    contentPadding: EdgeInsets.zero,
                                    subtitle: Obx(
                                      () => SizedBox(
                                        child: RadioGroup<String>.builder(
                                          direction: Axis.horizontal,
                                          activeColor: CustomColors.orange,
                                          horizontalAlignment:
                                              MainAxisAlignment.start,
                                          spacebetween: 24,
                                          groupValue: subtopicModel
                                              .questionsList![index]
                                              .option!
                                              .value,
                                          onChanged: (value) {
                                            subtopicModel.questionsList![index]
                                                .option!.value = value!;
                                            //print(option);
                                          },
                                          items: const ["Yes", "No", "NA"],
                                          itemBuilder: (item) =>
                                              RadioButtonBuilder(item),
                                        ),
                                      ),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          subtopicModel.questionsList!
                                              .removeAt(index);
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: CustomColors.grey600,
                                        )),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                )
                              : const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                        "No questions here! Please add some questions."),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
