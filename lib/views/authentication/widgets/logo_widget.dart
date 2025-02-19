import 'package:flutter/material.dart';

Widget logoWidget() {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Image.asset('assets/images/icon.png'),
    ),
  );
}
