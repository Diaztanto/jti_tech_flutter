import 'package:get/get.dart';

abstract class TrxController extends GetxController {
  final List<List<String>> dropDownValues = [];
  final List<void Function(String?)> onAppBarDropDownChanges = [];
  final List<Rxn> formObservables = [];
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
  final List<Rxn> formObservables = [
    Rxn<DateTime>(DateTime.now())
  ];

  @override
  final List<void Function(String?)> onAppBarDropDownChanges = [(param) {}];
}
