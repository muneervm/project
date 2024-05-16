import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/views/home.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Success: ${response.paymentId}'),
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} - ${response.message}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Error: ${response.code} - ${response.message}'),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('External Wallet: ${response.walletName}'),
    ));
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_test_z29iJJ21IY7rBQ',
      'amount': 10000, // 100000  (in paise)
      'name': 'M-Recipe',
      'description': 'Premium Subscription',
      'prefill': {'contact': '9744656196', 'email': 'vmmohammed88@gmail.com'},
      'external': {
        'wallets': ['paytm', 'phonepe', ],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error initializing Razorpay: $e');
    }
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    key: _scaffoldKey,
    body: Stack(
      fit: StackFit.expand,
      children: [
        // Lottie animation as the background
        Lottie.network(
          'https://lottie.host/4383d676-4e3e-40ab-98e2-ab72452c4505/NRN9H7PNZo.json',
          repeat: true,
          reverse: true,
          animate: true,
        ),
        // Content on top of the animation
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    backgroundColor: Color.fromARGB(255, 59, 205, 64),
                  ),
                  child: const Text(
                    'Free Trial',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 253, 254, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _openCheckout();
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    backgroundColor: Color.fromARGB(255, 51, 121, 195),
                  ),
                  child: const Text(
                    'premium',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 253, 254, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}