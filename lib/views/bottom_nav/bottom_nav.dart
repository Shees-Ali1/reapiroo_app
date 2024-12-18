import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/controllers/user_controller.dart';
import 'package:repairoo/views/booking_screens/booking_screen_main.dart';
import 'package:repairoo/views/chat_screens/chat_screen_main.dart';
import 'package:repairoo/views/home_screen_for_tech/Home_screen.dart';
import 'package:repairoo/views/home_screens_for_customers/CustomerHomeScreen.dart';
import 'package:repairoo/views/tech_orderscreen/order_screen.dart';
import 'package:repairoo/views/profile_screens/profile_screen.dart';

import '../../const/images.dart';
import '../../controllers/nav_bar_controller.dart';
import '../../widgets/drawer.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final UserController userVM = Get.put(UserController());

  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final NavBarController navBarController = Get.put(NavBarController());

  void _navigateToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    _controller.jumpTo(pageIndex);
    Navigator.pop(context); // Close the drawer after navigation
  }

  @override
  Widget build(BuildContext context) {
    bool isIpad = MediaQuery.of(context).size.width > 600;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the dynamic icon height (e.g., 5% of the screen height)
    double iconHeight = screenHeight * 0.05; // Adjust the percentage as needed

    // Determine the scale factor for the icons
    double iconScale = iconHeight / 20;

    // Move bottomBarPages into build method to ensure userVM is accessible
    List<Widget> bottomBarPages = [
      userVM.userRole.value == "Customer" ? Customerhomescreen() : HomeScreen(),
      // if (userVM.userRole.value != "Customer") OrderScreen(),
      const BookingScreenMain(),
      const ChatsScreenMain(),
      const ProfileScreen(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: navBarController.scaffoldKey,
      drawer: const MyDrawer(),

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
              (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,

      bottomNavigationBar: AnimatedNotchBottomBar(
        showBlurBottomBar: false,
        showShadow: false,
        itemLabelStyle: TextStyle(
          color: AppColors.secondary,
          fontWeight: FontWeight.w400,
          fontSize: isIpad ? 5.sp : 8.sp,
        ),
        blurFilterY: 10,
        blurFilterX: 10,
        notchBottomBarController: _controller,
        notchColor: AppColors.primary,
        color: AppColors.primary,
        showLabel: true,
        shadowElevation: 0,
        kBottomRadius: 15.0,
        bottomBarWidth: 100.w,
        bottomBarHeight: 11.h,
        removeMargins: false,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.homeicon),
            activeItem: Image.asset(
              AppImages.homeicon,
              fit: BoxFit.contain,

              alignment: Alignment.center,
            ),
            itemLabel: 'Home'.tr,
          ),
          // if (userVM.userRole.value != "Customer")
          //   BottomBarItem(
          //     inActiveItem: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          //     activeItem: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          //     itemLabel: 'Orders'.tr,
          //   ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.bookingicon),
            activeItem: Image.asset(
              fit: BoxFit.contain,
              alignment: Alignment.center,

              AppImages.bookingicon,
            ),
            itemLabel: 'Request'.tr,
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.chaticon),
            activeItem: Image.asset(
              alignment: Alignment.center,
              fit: BoxFit.contain,

              AppImages.chaticon,
            ),
            itemLabel: 'Chat'.tr,
          ),
          BottomBarItem(
            inActiveItem: Image.asset(AppImages.profileicon),
            activeItem: Image.asset(
              alignment: Alignment.center,
              fit: BoxFit.contain,

              AppImages.profileicon,
            ),
            itemLabel: 'Profile'.tr,
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 22.sp,
      ),
    );
  }
}
