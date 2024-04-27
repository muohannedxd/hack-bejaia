// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';
import 'package:navira/data/quais.dart';

class Quailist extends StatelessWidget {
  const Quailist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Liste Des Quais',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: quaiData.values.map((quai) {
                return (GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/quai',
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4),
                            width: 1.0), // Red thin border
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/logo/${quai.icon}.png',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                quai.name,
                                style: TextStyle(
                                    fontSize: TextSizes.medium,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                quai.status,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: CustomColors.textGrey),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                'assets/logo/${quai.status}.png',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
