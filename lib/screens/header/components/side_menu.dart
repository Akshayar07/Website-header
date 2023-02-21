import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants.dart';
import '../../../controller/menu_controller.dart';


class SideMenu extends StatelessWidget {

  final MenuController _controller = Get.put(MenuController());


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: kDarkBlackColor,
          child: Obx(
                ()=>ListView(
              children: [
                DrawerHeader(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding *3.5,
                        vertical: kDefaultPadding *2.5
                      ),
                      child:Text('Logo',
                        style: TextStyle(color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),),
                    )
                ),
                ...List.generate(_controller.menuItems.length,
                        (index) => DrawerItem(
                      isActive: index == _controller.selectedIndex,
                      title: _controller.menuItems[index],
                      press: (){_controller.setMenuIndex(index);
                      },
                    ))
              ],
            ),
          )
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {

  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key? key, required this.title, required this.isActive, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      selected: isActive,
      selectedTileColor:kPrimaryColor,
      onTap: press,
      title: Text(title,
        style: TextStyle(color: Colors.white),),
    );
  }
}
