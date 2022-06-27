import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




//Result Widget
Widget result(String title, double? amount){
  return ListTile(
    title: Text(
      title,
      style: TextStyle(fontSize: 20),
    ),
    trailing: Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Text(
        String.fromCharCode(0x20A6) + amount!.toStringAsFixed(2),
        style: TextStyle(
          fontSize: 19.0,
        ),
      ),
    ),
  );
}