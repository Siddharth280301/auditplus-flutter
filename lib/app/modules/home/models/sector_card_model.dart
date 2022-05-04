import 'package:flutter/material.dart';

class SectorCardModel {
  int sectorId;
  String sectorName;
  String surveyTime;
  String sectorDesc;
  bool isUserSector;
  IconData sectorIcon;

  SectorCardModel(
      {this.sectorId = 0,
      this.sectorName = "NA",
      this.surveyTime = "NA",
      this.sectorDesc = "NA",
      this.sectorIcon = Icons.account_balance,
      this.isUserSector = false});
}
