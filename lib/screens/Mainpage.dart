// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:navira/components/custom_appbar.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  String searchController = '';
  List<bool> showSubCategory = [false, false, false];

  void toggleSubcategories(int index) {
    setState(() {
      for (int i = 0; i < showSubCategory.length; i++) {
        if (i != index) showSubCategory[i] = false;
      }
      showSubCategory[index] = !showSubCategory[index];
    });
  }

  void submitSearch(String search) {
    setState(() {
      searchController = search;
    });
    if (!searchController.isEmpty) {
      Navigator.pushNamed(
        context,
        '/search',
        arguments: searchController,
      );
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.bgColor,
        body: ListView(
          children: [
            // app bar
            Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 12, top: 12, bottom: 6, left: 6),
                  child: CustomAppBar(),
                )),

            SizedBox(
              height: 20,
            ),

            // searchBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 10,
                            right: 10,
                          ),
                        ),
                        // Key modification: Add the onSubmitted callback
                        onSubmitted: (value) => submitSearch(value),
                        onChanged: (value) {
                          setState(() {
                            searchController = value;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/logo/search_filled.png',
                        width: 22,
                        color: CustomColors.textPrimary,
                      ),
                      onPressed: () => submitSearch(
                          searchController), // Or call submitSearch directly here
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Container(
                padding: EdgeInsets.all(20),
                color: CustomColors.white,
                child: Column(
                  children: [
                    Text('Nombre de quais disponibles maintenant'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PIE'),
                        Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.blue),
                                SizedBox(width: 10,),
                                Text('Disponible'),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(backgroundColor: Colors.red),
                                SizedBox(width: 10,),
                                Text('Occupé'),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
