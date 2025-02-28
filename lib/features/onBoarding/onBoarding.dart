import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/features/routes/app_router.gr.dart';
import 'package:rive/rive.dart' as rive;

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/Spline.png"),
          rive.RiveAnimation.asset("assets/images/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          Positioned.fill(top: 1, child: const SizedBox()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    const Text(
                      "Just A Demo For Bloc state Managment",
                      style: TextStyle(
                        fontSize: 45,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    IconButton(
                      iconSize: 30,
                        onPressed: () {
                          context.router.push(Home());
                        },
                        icon: const Icon(Icons.arrow_right_alt_rounded)),
                    const Text(
                      "application of store just for testing features of bloc",
                      style: TextStyle(fontSize: 20, height: 1),
                    ),
                    const Spacer(flex: 2),
                    SizedBox(height: 20), // Reduce spacing here
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
