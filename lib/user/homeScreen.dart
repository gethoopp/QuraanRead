import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:lottie/lottie.dart';
import 'botomnav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 134, 12, 138),
                      Color.fromARGB(255, 79, 3, 122),
                    ],
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Quraan Read',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: RichText(
                          text: const TextSpan(
                              text: '   Learn Quraan and',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\n Recite once everyday',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                  ),
                                )
                              ]),
                        ),
                      ),
                      Lottie.asset('assets/images/i1.json',
                          width: 300, height: 300),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageAnimationTransition(
                                    pageAnimationType:
                                        LeftToRightFadedTransition(),
                                    page: bottomNav(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 147, 80),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text('Get Started'),
                          );
                        }),
                      ),
                    ]))));
  }
}
