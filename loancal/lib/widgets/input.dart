import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';


Widget inputForm(String title, String hintText, TextEditingController _controller,){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: GoogleFonts.robotoMono(fontSize: 20),
      ),
      SizedBox(height: 5),
      Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            hintText:  hintText,
            hintStyle: GoogleFonts.robotoMono(fontSize: 20),
          ),
        ),
      )
    ],
  );
}
