import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 251, 131, 57),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Visibility(
              visible: isVisible,
              child: ElevatedButton(
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: Text("รายเก่า",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(235, 255, 255, 255),
                    minimumSize: const Size(300, 100),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            Visibility(
              visible: isVisible,
              child: ElevatedButton(
                  onPressed: () {},
                  // ignore: sort_child_properties_last
                  child: Text("รายใหม่",
                      style: GoogleFonts.notoSansThai(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(235, 255, 255, 255),
                    minimumSize: const Size(300, 100),
                  )),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(235, 251, 131, 57),
          size: 55,
        ),
      ),
    );
  }
}
