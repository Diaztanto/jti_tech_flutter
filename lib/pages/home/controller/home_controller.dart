import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late  TabController tabController;
  final RxBool isSliding = false.obs;
  final RxBool isSliderOpen = false.obs;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 4, vsync: this);
  }
}
