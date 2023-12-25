import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tech_test_flutter/pages/trx/controller/trx_controller.dart';

class TrxPage extends StatelessWidget {
  TrxController get _trxController => Get.find<TrxController>();

  const TrxPage.masuk({super.key})
      : title = 'Masuk',
        bottom = const OutletDropDownWidget(
          index: 0,
        ),
        form = const [DateFormWidget(formIndex: 0)];

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
        title: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              height: 16.41 / 14),
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize:
                Size(MediaQuery.of(context).size.width, kToolbarHeight + 50),
            child: Padding(
              padding: const EdgeInsets.all(33.0),
              // padding: EdgeInsets.zero,
              child: bottom,
            )),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...form,
                Padding(
                  padding: const EdgeInsets.only(bottom: 73),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Material(
                      color: Color(0xffC1DDED),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 8),
                        child: InkWell(
                          onTap: () => print('debug submit'),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class OutletDropDownWidget extends StatelessWidget {
  const OutletDropDownWidget({super.key, required this.index});

  TrxController get _trxController => Get.find<TrxController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
      items: List.generate(
          _trxController.dropDownValues[index].length,
          (i) => DropdownMenuItem(
                  child: Text(
                _trxController.dropDownValues[index][i],
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ))),
      onChanged: _trxController.onAppBarDropDownChanges[index],
      buttonStyleData: ButtonStyleData(
          height: 30,
          // width: 108,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    offset: Offset(0, 3),
                    blurRadius: 8)
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffC1DDED))),
      iconStyleData: IconStyleData(
          icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Theme.of(context).colorScheme.primary,
      )),
      dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      barrierColor: Colors.black.withOpacity(.5),
    ));
    // return DropDown
    // return DropdownSearch<String>(items: _trxController.dropDownValues[index], dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration()),);
    // return DropdownButton<String>(
    //   items: List.generate(
    //       _trxController.dropDownValues[index].length,
    //       (i) => DropdownMenuItem(
    //           child: Text(_trxController.dropDownValues[index][i]))),
    //   onChanged: _trxController.onAppBarDropDownChanges[index],
    // );
  }
}

class DateFormWidget extends StatelessWidget {
  const DateFormWidget({super.key, required this.formIndex});

  TrxController get _trxController => Get.find<TrxController>();
  final int formIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text("Start Date"),
          SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 30,
              width: MediaQuery.sizeOf(context).width,
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () => showDatePicker(
                          context: context,
                          firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                          lastDate: DateTime.now())
                      .then(
                    (value) {
                      if (value != null) {
                        _trxController.formObservables[0].value = value;
                      } else {
                        _trxController.formObservables[0].value =
                            DateTime.now();
                      }
                    },
                  ),
                  child: Obx(() =>
                      Center(child: Text(_trxController.formObservables[0].value.toString()))), // todo format
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
