import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pencari_Kos/home_controller.dart';
import 'package:sahabatkosku/app/page/page_pencari_kos/account_page.dart';
import 'package:sahabatkosku/app/page/page_pencari_kos/cari_kos.dart';
import 'package:sahabatkosku/app/page/page_pencari_kos/kos_ditempat.dart';
import 'package:sahabatkosku/app/page/page_pencari_kos/kos_tandai.dart';
import 'package:sahabatkosku/app/page/page_pencari_kos/notifikasi_page.dart';

class LandingPage_PencariKos extends GetView {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data:
            MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            unselectedItemColor: Color.fromARGB(255, 156, 151, 151),
            selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 0
                          ? Color.fromARGB(255, 0, 0, 0)
                          : null,
                    ),
                    Icon(Icons.search, size: 20.0),
                  ],
                ),
                label: 'Cari kos',
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 1
                          ? Color.fromARGB(255, 0, 0, 0)
                          : null,
                    ),
                    Icon(Icons.bookmark_added, size: 20.0),
                  ],
                ),
                label: 'Ditandai',
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                    Icon(Icons.home_filled, size: 20.0),
                  ],
                ),
                label: 'Kos Saya',
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                    Icon(Icons.notifications_active, size: 20.0),
                  ],
                ),
                label: 'Notifikasi',
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      width: 20,
                      color: landingPageController.tabIndex.value == 2
                          ? Color.fromARGB(255, 0, 0, 0)
                          : Color.fromARGB(255, 255, 255, 255),
                    ),
                    Icon(Icons.account_circle, size: 20.0),
                  ],
                ),
                label: 'Akun',
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController landingPageController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              KostView(),
              DitandaiPage(),
              KostCard(),
              NotificationSettingsPage(),
              ProfileView_PencariKos()
            ],
          )),
    ));
  }
}
