import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vit_auto_booking/features/personalisation/past%20activity/activity.dart';
import 'package:vit_auto_booking/features/shop/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    Color getIconColor(int index) {
      return controller.selectedIndex.value == index
          ? const Color.fromARGB(255, 147, 112, 219)
          : (darkMode ? Colors.white : Colors.black);
    }

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
          indicatorColor:
              const Color.fromARGB(255, 147, 112, 219).withOpacity(0.2),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: getIconColor(0)),
              label: 'Home',
              selectedIcon: Icon(Iconsax.home, color: getIconColor(0)),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.sagittarius, color: getIconColor(1)),
              label: 'Activity',
              selectedIcon: Icon(Iconsax.sagittarius, color: getIconColor(1)),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: getIconColor(2)),
              label: 'Profile',
              selectedIcon: Icon(Iconsax.user, color: getIconColor(2)),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  List<Widget> get screens {
    final Brightness brightnessValue =
        MediaQuery.of(Get.context!).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return [
      const Home(),
      PastAutoBookings(darkMode: darkMode),
    ];
  }

  void goToChats() {
    selectedIndex.value = 2; // Index of the ChatScreen in the screens list
  }
}
