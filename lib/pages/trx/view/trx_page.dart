import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tech_test_flutter/pages/trx/controller/trx_controller.dart';

class TrxPage extends StatelessWidget {
  TrxController get _trxController => Get.find<TrxController>();

  const TrxPage.masuk({super.key})
      : title = 'Masuk',
        bottom = const OutletDropDownWidget(),
        form = const [];

  // const TrxPage.keluar({super.key}) : title = 'Keluar';
  // const TrxPage.pindah({super.key}) : title = 'Pindah';
  // const TrxPage.mutasi({super.key}) : title = 'Mutasi';
  // const TrxPage.kurs({super.key}) : title = 'Kurs';

  final String title;
  final Widget bottom;
  final List<Widget> form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

class OutletDropDownWidget extends StatelessWidget {
  const OutletDropDownWidget({super.key});

  TrxController get _trxController => Get.find<TrxController>();
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(child: Text('Nama Outlet'))
      ], // todo generate pke data dri API
      onChanged: _trxController.onAppBarDropDownChange,
    );
  }
}
