// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  void navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/homepage',
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo/logo.png',
                  width: 240,
                  height: 240,
                ),
                Text('Navira',
                    style: TextStyle(
                        fontFamily: 'OleoScript',
                        fontSize: TextSizes.splash,
                        color: CustomColors.textGrey)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    color: CustomColors.grey,
                    thickness: 3,
                    indent: 40,
                    endIndent: 40,
                  ),
                ),
                Text(
                  'Des quais efficaces, Des navires réussis',
                  style: TextStyle(
                      fontSize: TextSizes.subtitle,
                      color: CustomColors.textGrey),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: FilledButton(
            child: Text(
              "Démarrer",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: TextSizes.subtitle),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(CustomColors
                  .buttonPrimary), // Set the background color to blue
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            onPressed: () => navigateToHomePage(context),
          ),
        ),
      ]),
    );
  }
}
