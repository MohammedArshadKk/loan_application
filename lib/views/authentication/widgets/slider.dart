import 'package:flutter/material.dart';

Widget slider({
    required String title, 
    required double value,
    required double min,
    required double max,
    required String unit,
    required Function(double) onChanged,
    required String Function(double) formatter,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                onChanged: onChanged,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                formatter(value),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatter(min), style: TextStyle(color: Colors.grey)),
            Text(formatter(max), style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }