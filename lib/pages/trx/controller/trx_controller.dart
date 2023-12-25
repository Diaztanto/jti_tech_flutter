import 'package:get/get.dart';

abstract class TrxController extends GetxController {
  final List<List<String>> dropDownValues = [];
  final List<void Function(String?)> onAppBarDropDownChanges = [];
  // List<void Function(String?)> get onAppBarDropDownChanges => [];
  // void onAppBarDropDownChange(String? value);
}

class MasukTrxController extends TrxController {
  @override
  final List<List<String>> dropDownValues = [
    // todo generate dri API
    ["Nama Outlet"]
  ];
  @override
  final List<void Function(String?)> onAppBarDropDownChanges = [(param) {}];
}
