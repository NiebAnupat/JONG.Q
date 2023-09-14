import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StudentBox extends StatelessWidget {
  final String child;

  StudentBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
      child: Container(
        height: 105,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 218, 133, 76)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListTile(
              title: Text(
                child,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                '094-123-4567',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                    size: 30,
                  )),
            )),
      ),
    );
  }
}
