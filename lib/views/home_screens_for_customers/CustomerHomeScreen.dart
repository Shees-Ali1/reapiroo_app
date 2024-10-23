import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repairoo/controllers/home_controller.dart';
import 'package:repairoo/views/home_screen_for_tech/main_home.dart';
import 'package:repairoo/views/home_screens_for_customers/customer_main_home.dart';
import 'package:repairoo/views/home_screens_for_customers/customer_task_home.dart';

class Customerhomescreen extends StatefulWidget {
  const Customerhomescreen({super.key});

  @override
  State<Customerhomescreen> createState() => _CustomerhomescreenState();
}

class _CustomerhomescreenState extends State<Customerhomescreen> {

  final HomeController customerVM = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Obx(()=> customerVM.isHome.value == "customer main"
                ? CustomerMainHome()
                : CustomerTaskHome(service: customerVM.service.value,
            )
    );
  }
}
