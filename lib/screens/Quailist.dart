import 'package:flutter/material.dart';
import 'package:navira/constants/custom_colors.dart';
import 'package:navira/constants/text_sizes.dart';

class Quailist extends StatelessWidget {
  const Quailist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColors.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Liste Des Quais',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: CustomColors.textPrimary, fontSize: TextSizes.title),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: MyScrollableList(),
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              borderRadius:
                  BorderRadius.circular(10.0), // Set the border radius here
            ),
          ),
        ),
      ),
    );
  }
}

class MyScrollableList extends StatelessWidget {
  const MyScrollableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyCard(
          emoji: '👤', // Passenger emoji
          quaiNumber: 'Quai 1',
          status: true, // Available status
        ),
        MyCard(
          emoji: '⛽', // Petroleum barrel emoji
          quaiNumber: 'Quai 2',
          status: false, // Occupied status
        ),
        MyCard(
          emoji: '📦', // Merchandise emoji
          quaiNumber: 'Quai 3',
          status: true, // Available status
        ),
        MyCard(
          emoji: '👤', // Passenger emoji
          quaiNumber: 'Quai 4',
          status: false, // Occupied status
        ),
        MyCard(
          emoji: '⛽', // Petroleum barrel emoji
          quaiNumber: 'Quai 5',
          status: true, // Available status
        ),
      ],
    );
  }
}

class MyCard extends StatelessWidget {
  final String emoji;
  final String quaiNumber;
  final bool status; // true for available, false for occupied

  const MyCard({
    Key? key,
    required this.emoji,
    required this.quaiNumber,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  emoji,
                  style: TextStyle(fontSize: 24), // Adjust size as needed
                ),
                SizedBox(width: 8), // Add spacing between emoji and quai number
                Text(quaiNumber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                status
                    ? Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Disponible',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Occupé',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
