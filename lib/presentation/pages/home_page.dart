import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizizz_app/presentation/widgets/gradinet_button.dart';
// import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height / (100 / 40),
            color: Colors.white,
          ),
          Container(
            width: Get.width,
            height: Get.height / (100 / 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/books.png",
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / (100 / 60),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.indigo,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: Get.height / (100 / 60),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: Get.height / (100 / 7)),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter your Name...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                    const SizedBox(height: 32),
                    GradientButton(buttonText: 'Play', onTap: () {}),
                    GradientButton(buttonText: 'Leaderboard', onTap: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
