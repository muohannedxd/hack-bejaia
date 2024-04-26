// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final searchKey = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        backgroundColor: CustomColors.bgColor,
        body: Center(
          child: Text(searchKey),
        ));
  }
}
