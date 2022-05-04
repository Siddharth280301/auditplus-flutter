import 'dart:convert';

import 'package:auditplus/app/modules/home/models/main_sectors.dart';
import 'package:auditplus/app/modules/home/models/sector_card_model.dart';
import 'package:auditplus/app/values/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs, sectorError = false.obs;
  RxList<SectorCardModel> sectors = RxList.empty();
  static List<IconData> iconList = [
    Icons.account_balance_rounded,
    Icons.precision_manufacturing_rounded,
    Icons.local_hospital_outlined,
    Icons.restaurant_rounded,
    Icons.school_rounded,
    Icons.local_hotel_rounded,
    Icons.local_movies_outlined
  ];

  List<SectorCardModel> get sectorList => sectors.toList();
  var userData = Get.arguments;

  void getAllSectors() async {
    try {
      isLoading.value = true;
      var url = "${Urls.baseUrl}${Urls.getSectors}";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var mainSectors = MainSectors.fromJson(result);
        if (mainSectors.message == "Success" && mainSectors.data != null) {
          for (var element in mainSectors.data!) {
            sectors.add(SectorCardModel(
              sectorId: element.deptId!,
              sectorName: element.deptName!,
              sectorIcon: iconList[element.deptId!],
              isUserSector: false,
            ));
          }
        }
      } else {
        sectorError.value = true;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void getUserSector() async {
    try {} catch (e) {
      print(e);
    }
  }

  void addUserSector() async {
    try {
      var url = "${Urls.baseUrl}${Urls.addUserSector}";
      var data = {};
      var response = await http.post(Uri.parse(url), body: jsonEncode(data));
      if (response.statusCode == 200) {
      } else {
        // something went wrong
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchAllReports() {
    try {} catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
    getAllSectors();
  }
}

// final RxList<SectorCardModel> sectors = [
//   SectorCardModel(
//     sectorId: 1,
//     isUserSector: false,
//     sectorName: "Educational",
//     surveyTime: "3",
//     sectorIcon: Icons.school_rounded,
//   ),
//   SectorCardModel(
//     sectorId: 2,
//     isUserSector: false,
//     sectorName: "Restaurant",
//     surveyTime: "3",
//     sectorIcon: Icons.restaurant_rounded,
//   ),
//   SectorCardModel(
//     sectorId: 3,
//     isUserSector: false,
//     sectorName: "Manufacturing",
//     surveyTime: "3",
//     sectorIcon: Icons.precision_manufacturing_rounded,
//   ),
//   SectorCardModel(
//     sectorId: 4,
//     isUserSector: false,
//     sectorName: "Hospitals",
//     surveyTime: "3",
//     sectorIcon: Icons.local_hospital_outlined,
//   ),
//   SectorCardModel(
//     sectorId: 5,
//     isUserSector: false,
//     sectorName: "Hospitality",
//     surveyTime: "3",
//     sectorIcon: Icons.local_hotel_rounded,
//   ),
// ].obs;
