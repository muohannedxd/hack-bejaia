import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/screens/Homepage.dart';
import 'package:navira/screens/Quai.dart';
import 'package:navira/screens/Search.dart';
import 'package:navira/screens/Splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://qiugbkgmpybdczwsxgyh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFpdWdia2dtcHliZGN6d3N4Z3loIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQwODM5OTMsImV4cCI6MjAyOTY1OTk5M30.FlmQ0RlOeLRaJ75AKEJyqTwWFMrsgl3TJ2L2YgDUuIQ',
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: CustomColors.bgColor, // Set the status bar color to white
    statusBarIconBrightness:
        Brightness.dark, // Set the status bar icons to dark
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navira',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Nunito',
      ),
      initialRoute: '/',
      routes: {
        '/homepage': (context) => Homepage(currentIndex: 0),
        '/search': (context) => Search(),
        '/quai': (context) =>  Quai(),
      },
      home: const Splash()
    );
  }
}