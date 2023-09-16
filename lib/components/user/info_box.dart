import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "ข้อมูลนักศึกษา",
                style: GoogleFonts.notoSansThai(
                    fontSize: 20, color: const Color.fromARGB(255, 0, 0, 0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
