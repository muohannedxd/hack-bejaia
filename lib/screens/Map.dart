// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:latlong2/latlong.dart'; // Import LatLng from the correct package

class Settings extends StatelessWidget {
  const Settings({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.bgColor,
        body: Center(
            child: FlutterMap(
                options: MapOptions(
                  center: LatLng(36.752294, 5.090494), 
                  zoom: 15,
                ),
                children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ])));
  }
}
