import 'package:flutter/material.dart';

Widget notificationWidget(String label) {
  return Container(
    margin: EdgeInsets.all(15.0),
    height: 40.0,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 2))
        ]),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20.0),
          ),
        ]),
  );
}
