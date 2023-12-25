import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tech_test_flutter/pages/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ApiService get _apiService => Get.find<ApiService>();
  HomeController get _homeController => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Text(
            "APP KEUANGAN",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 16.41 / 14),
          ),
          actions: [
            Image.asset(
              'assets/icons/Button Notifikasi@1x.png',
              height: 35,
              width: 35,
            ),
            SizedBox(
              width: 14,
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 100),
            child: Column(
              children: [
                TabBar(
                    controller: _homeController.tabController,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        text: 'HOME',
                        icon: Image.asset(
                            'assets/icons/Button Home Aktif@1x.png'),
                        // height: 50,
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text:
                            'TRANSAKSI', // todo ganti jdi child biar custom opacity & size
                        icon: Image.asset(
                            'assets/icons/Button Transaksi Tidak Aktif@1x.png'),
                        // height: 50,
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: 'LAPORAN',
                        icon: Image.asset(
                            'assets/icons/Button Laporan Tidak Aktif@1x.png'),
                        // height: 50,
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        text: 'TOOLS',
                        icon: Image.asset(
                            'assets/icons/Button Tools Tidak Aktif@1x.png'),
                        // height: 50,
                        iconMargin: EdgeInsets.zero,
                      )
                    ]),
                InkWell(
                  child: Image.asset(
                    'assets/icons/Button Refresh@1x.png',
                    width: 33,
                  ),
                  onTap: () => print('debug refresh'),
                )
              ],
            ),
          ),
        ),
        SliverFillViewport(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              color: Theme.of(context).colorScheme.primary,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OutletCardWidget();
                  },
                  itemCount: 1,
                  padding: EdgeInsets.symmetric(vertical: 8.5)),
            );
          }),
        )
      ],
    ));
  }
}

class OutletCardWidget extends StatelessWidget {
  const OutletCardWidget({super.key});
  HomeController get _homeController => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: SizedBox(
          width: 340,
          height: 158,
          child: Material(
            color: Colors.white,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Outlet",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 35, 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/icons/Icon Rupiah@1x.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "IDR",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff6F6F6F)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: DottedLine(
                                  dashColor: Color(0xffC1DDED),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "500.000",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => Container(
                      width: 340,
                      height: 158,
                      color: _homeController.isSliderOpen.value
                          ? Colors.white.withOpacity(.5)
                          : Colors.transparent,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Color(0xffC1DDED),
                      child: InkWell(
                        onTap: () => _homeController.isSliderOpen.value =
                            !_homeController.isSliderOpen.value,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Center(
                            child: Obx(() => Image.asset(
                                  _homeController.isSliderOpen.value
                                      ? 'assets/icons/Button Close Slide@1x.png'
                                      : 'assets/icons/Button Open Slide@1x.png',
                                  width: 18,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Obx(() => AnimatedContainer(
                          key: ValueKey(_homeController.isSliderOpen.value),
                          duration: Duration(milliseconds: 300),
                          width: _homeController.isSliderOpen.value ? 297 : 0,
                          height: 158,
                          padding: EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          color: Color(0xffC1DDED),
                          child: AnimatedSwitcher(
                            key: ValueKey(_homeController.isSliderOpen.value &&
                                !_homeController.isSliding.value),
                            duration: Duration(milliseconds: 300),
                            child: _homeController.isSliderOpen.value &&
                                    !_homeController.isSliding.value
                                ? Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () => Get.toNamed('/Masuk'),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/icons/Button Input Masuk@1x.png',
                                                height: 24,
                                              ),
                                              Text(
                                                "MASUK",
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/Button Input Keluar@1x.png',
                                              height: 24,
                                            ),
                                            Text(
                                              "KELUAR",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/Button Input Pindah@1x.png',
                                              height: 24,
                                            ),
                                            Text(
                                              "PINDAH",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/Button Input Mutasi@1x.png',
                                              height: 24,
                                            ),
                                            Text(
                                              "MUTASI",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/icons/Button Input Kurs@1x.png',
                                              height: 24,
                                            ),
                                            Text(
                                              "KURS",
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Material(
                                        color: Colors.white,
                                        child: SizedBox(
                                          height: 78,
                                          width: 249,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Jumlah Barang",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Expanded(
                                                        child: DottedLine(
                                                      dashColor:
                                                          Color(0xffC1DDED),
                                                    )),
                                                    Text(
                                                      "16",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Total IDR",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                    Expanded(
                                                        child: DottedLine(
                                                      dashColor:
                                                          Color(0xffC1DDED),
                                                    )),
                                                    Text(
                                                      "Rp 100.000.000",
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ])
                                : Container(),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
