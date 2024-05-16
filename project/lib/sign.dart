import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/login.dart';
import 'package:project/subs.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 204, 218),
        title: const Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [],
        
      ),
      body: Stack(
        children: [
         
          Image.asset(
            'assets/signup.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: usernameController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorText: usernameValidate(usernameController.text),
                      labelText: "Username",
                      prefixIcon: const Icon(Icons.hdr_auto_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: userPhoneNumberController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorText: phoneNumber(userPhoneNumberController.text),
                      labelText: "Phone Number",
                      prefixIcon: const Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: userEmailController,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorText: validateEmail(userEmailController.text),
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: userPasswordController,
                    obscureText: true,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      errorText: validatePassword(userPasswordController.text),
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      var username = usernameController.text.trim();
                      var userPhoneNumber = userPhoneNumberController.text.trim();
                      var userEmail = userEmailController.text.trim();
                      var userPassword = userPasswordController.text.trim();

                      try {
                        // Create user in Firebase Authentication
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );

                        // Add user details to Firestore
                        await FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
                          'username': username,
                          'userPhoneNumber': userPhoneNumber,
                          'userEmail': userEmail,
                          'createdAt': DateTime.now(),
                          'userId': userCredential.user!.uid,
                          'password': userPassword,
                        });

                        print('User created in Firebase and Firestore');

                        // Navigate to the home page after signup
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SubscriptionPage()),
                        );
                      } catch (e) {
                        // Handle errors (e.g., user already exists, invalid email, etc.)
                        print('Error creating user: $e');
                        // You can show a Snackbar or any other UI to inform the user about the error.
                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10), backgroundColor: const Color.fromARGB(255, 17, 162, 75),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?", style: TextStyle(color: Colors.black)),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), backgroundColor: const Color.fromARGB(255, 62, 133, 233),
                        ),
                        onPressed: () {
                          // Navigate to the Login page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!value.contains("@")) {
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  String? usernameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a username";
    }
    return null;
  }

  String? phoneNumber(String? value) {
    if (value?.length == 10) {
      return null;
    } else {
      return "Please enter a valid phone number";
    }
  }
}
