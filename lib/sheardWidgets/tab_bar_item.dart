
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';


class TabBarItem extends StatelessWidget {
 bool isActive;
 String text;
 VoidCallback function;
 TabBarItem({required this.isActive,required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: GestureDetector(onTap: function,
        child: Column(
          children: [
            Text(text,style: TextStyle(color: isActive?ColorApp.primaryColor:ColorApp.grey, )),
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8),
              child: Container(

                height: 2,
                color: isActive?ColorApp.primaryColor:ColorApp.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
