import 'package:flutter/material.dart';

Widget buildIconCard(IconData icon, String label) {
  return Card(
    child: Container(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.green[400],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Widget buildNewsCard() {
  return Card();
}
