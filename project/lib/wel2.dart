import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:lottie/lottie.dart';
import 'package:project/wel3.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key, Key});

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
                'https://lottie.host/8550c88a-37c2-4fca-b2f0-d77151998166/qOIVO9Fmkn.json',
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
                    'COOKING IS A GREATFUL SKILL. KEEP THAT IN YOUR MIND',
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
                        activeThumbColor: const Color.fromARGB(255, 38, 129, 248),
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WelcomePage3()),
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
