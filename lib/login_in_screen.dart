import 'package:chatbox/Home.dart';
import 'package:chatbox/forgot_password.dart';
import 'package:chatbox/onboarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  // Initialize controllers for email and password fields
  final emailctlr = TextEditingController();
  final passwordctlr = TextEditingController();

  void Login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailctlr.text,
        password: passwordctlr.text,
      );
      // If login is successful, navigate to the Home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.code == 'user-not-found'
                ? 'No user found for that email.'
                : e.message ?? 'Login failed.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Login", style: TextStyle(color: Color(0xFF757575))),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Logo or Header Image
                Image.asset(
                  'assets/images/Login_text.png', // Make sure it's in pubspec.yaml
                  width: 250,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),

                // Description Text
                const Text(
                  'Welcome back! Sign in using your social account or email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff797C7B),
                  ),
                ),

                const SizedBox(height: 24),

                // Social Media Buttons
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/google-logo.png',
                          ), // Ensure you have a Google logo image in your assets
                        ),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            'assets/images/Apple_Inc.-Logo.wine (1).png',
                          ), // Ensure you have an Apple logo image in your assets
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // OR divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 24),

                // Email TextField
                TextField(
                  controller: emailctlr,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.teal),
                  ),
                ),

                const SizedBox(height: 12),

                // Password TextField
                TextField(
                  controller: passwordctlr,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.teal),
                  ),
                ),

                const SizedBox(height: 24),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Login(); // Call the login function when pressed
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xff797C7B),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Log in', style: TextStyle(fontSize: 16)),
                  ),
                ),

                const SizedBox(height: 12),

                // Forgot password
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPassword(),
                        ),
                      ); // Navigate to forgot password screen
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingScreen(),
                          ),
                        ); // Navigate to sign up screen
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
