import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nice/controller/menu_controller.dart';
import 'package:nice/responsive.dart';
import 'package:nice/screens/header/components/social_header.dart';
import 'package:nice/screens/header/components/web_menu.dart';

import '../../../constants.dart';


class headerSection extends StatelessWidget {

  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 400,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: Row(
                children: [
                  if(!Responsive.isDesktop(context))
                    IconButton(onPressed: (){
                      _controller.openOrCloseDrawer();
                    },
                      icon: Icon(Icons.sort,
                        color: Colors.white,size: 25,)),
                  Text('Logo', style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 25),),
                  Spacer(),
                  if(Responsive.isDesktop(context))webmenu(),
                  Spacer(),
                  social(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
