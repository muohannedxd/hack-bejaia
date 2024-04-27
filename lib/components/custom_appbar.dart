// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            iconSize: 14,
            icon: Image.asset(
              'assets/logo/menu.png',
              color: CustomColors.textPrimary,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Localisation',
                style:
                    TextStyle(color: CustomColors.buttonPrimary, fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: CustomColors.buttonPrimary,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Port De Bejaia',
                    style: TextStyle(fontSize: TextSizes.subtitle))
              ],
            )
          ],
        ),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/notifications',
              );
            },
            iconSize: 32,
            icon: Icon(Icons.notifications_none_outlined)),
      ],
    );
  }
}
