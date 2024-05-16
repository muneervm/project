import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:lottie/lottie.dart';
import 'package:project/sign.dart';


class WelcomePage3 extends StatelessWidget {
  const WelcomePage3({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Lottie.network(
                'https://lottie.host/958e0258-116a-4f80-bd70-5a573e0a20b9/c7CkZJJSvD.json',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(80.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'MAKE IT FAST... MAKE IT DELICIOUS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 35, 109, 16),
                    ),
                  ),
                  const SizedBox(height: 65),
                  SizedBox(
                    width: 170, // Adjust the button width
                    height: 30,  // Adjust the button height
                    child: Transform.scale(
                      scale: 1.5, // Adjust the scale factor for the size
                      child: SwipeButton.expand(
                        thumb: const Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.white,
                        ),
                        activeThumbColor: const Color.fromARGB(255, 135, 20, 20),
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  SignupPage()),
                          );
                        },
                        child: const Text(
                          'READY',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
