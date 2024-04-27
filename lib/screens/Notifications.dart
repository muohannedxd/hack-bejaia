// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Notifications',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColors.textPrimary,
              fontSize: TextSizes.verybig),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(
                    12.0), // Set the border radius here // Example background color
              ),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Cette fonctionnalité sera bientôt disponible',
                  style: TextStyle(fontSize: TextSizes.subtitle),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      ),
    );
  }
}
