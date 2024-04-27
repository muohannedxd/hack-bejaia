// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:navira/components/custom_appbar.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';
import 'package:navira/data/navires.dart';
import 'package:pie_chart/pie_chart.dart';

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
    if (searchController.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/search',
        arguments: searchController,
      );
    }
  }

  // navires data

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // pie chart data
    Map<String, double> dataMap = {'Disponible': 6, 'Occupé': 17, 'Reservé': 3};

    return Scaffold(
        backgroundColor: CustomColors.bgColor,
        body: ListView(
          children: [
            // app bar
            Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 6, top: 12, bottom: 6, left: 6),
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
                          hintText: 'Trouver',
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

            // insightes
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(
                      12.0), // Set the border radius here // Example background color
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre de quais disponibles',
                      style: TextStyle(
                          color: CustomColors.textPrimary,
                          fontSize: TextSizes.title,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 14,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Coming ships
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(
                      12.0), // Set the border radius here // Example background color
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Navires à venir',
                      style: TextStyle(
                          color: CustomColors.textPrimary,
                          fontSize: TextSizes.title,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: naviresData.values.map((navire) {
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/navire',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(navire.name), // Display ship name
                                  Text(navire.departureTime
                                      .toString()), // Display departure time
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    navire.estimatedArrivalTime,
                                    style:
                                        TextStyle(color: Colors.red.shade900),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  IconButton(
                                      icon: Image.asset(
                                        'assets/logo/search_filled.png',
                                        width: 22,
                                        color: CustomColors.textPrimary,
                                      ),
                                      onPressed: () {
                                        showQuaiDialog(context);
                                        // showWarningDialog(context);
                                      } // Or call submitSearch directly here
                                      ),
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(), // Convert Iterable to List
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

void showQuaiDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: CustomColors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/logo/ship.png',
                  width: 32,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('QUAI 24',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: TextSizes.subtitle)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Est Disponible Maintenant pour le debarquement, Confirmer la reservation?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  child: FilledButton(
                      child: Text(
                        "Confirmer",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: TextSizes.medium),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColors
                                .buttonPrimary), // Set the background color to blue
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        showSuccessDialog(context);
                      } // Or call submitSearch directly here
                      ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: 120,
                  child: FilledButton(
                    child: Text(
                      "Retour",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: TextSizes.medium),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColors
                              .redAlert), // Set the background color to blue
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
      });
}

void showWarningDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: CustomColors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/logo/ship.png',
                  width: 32,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('WARNING!',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: TextSizes.subtitle)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Aucun Quai n’est disponible pour le moment pour le navire Bliss Ship",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  child: FilledButton(
                    child: Text(
                      "Retour",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: TextSizes.medium),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColors
                              .redAlert), // Set the background color to blue
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
      });
}

void showSuccessDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: CustomColors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/logo/success.png',
                  width: 72,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('RÉSERVATION RÉUSSIE',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: TextSizes.subtitle)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  child: FilledButton(
                    child: Text(
                      "Retour",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: TextSizes.medium),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          CustomColors
                              .redAlert), // Set the background color to blue
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ));
      });
}
