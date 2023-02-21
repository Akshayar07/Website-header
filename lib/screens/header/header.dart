import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nice/constants.dart';

import '../../controller/menu_controller.dart';
import 'components/header_Section.dart';
import 'components/side_menu.dart';
import 'components/web_menu.dart';

class header extends StatelessWidget {

  final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldKey,
      drawer: SideMenu(),
      body: Column(
        children: [
          headerSection()
        ],
      ),
    );
  }
}
