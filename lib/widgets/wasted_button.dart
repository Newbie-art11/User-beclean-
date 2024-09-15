import 'package:flutter/material.dart';

class WasteButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  WasteButton({
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Image.asset(iconPath,
                height: 100.0, color: Colors.white), // Ikon sampah
            SizedBox(width: 16.0),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
