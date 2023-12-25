import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tech_test_flutter/pages/home/controller/home_controller.dart';
import 'package:tech_test_flutter/pages/home/view/home_page.dart';
import 'package:tech_test_flutter/pages/trx/controller/trx_controller.dart';
import 'package:tech_test_flutter/pages/trx/view/trx_page.dart';

List<GetPage> routes = [
  GetPage(
      name: "/Home",
      page: () => const HomePage(),
      binding: BindingsBuilder.put(() => HomeController())),
  GetPage(
      name: '/Masuk',
      page: () => const TrxPage.masuk(),
      binding: BindingsBuilder.put(() => MasukTrxController()))
];
