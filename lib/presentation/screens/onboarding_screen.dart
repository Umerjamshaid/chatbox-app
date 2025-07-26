import 'package:chatbox/presentation/Screens/SignUp.dart';
import 'package:chatbox/presentation/Screens/login_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );

    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: const Color(0xFF43116A),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 👈 Make it visible
        centerTitle: true,
        elevation: 0, // Optional: removes shadow
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Optional: makes back icon visible
        title: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.contain,
          height: 19.2,
          width: 77,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43116A), Color(0xFF0A1832), Color(0xFF0A1832)],
            stops: [0.0, 0.3, 1.0],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    Text(
                      'Connect \nfriends',
                      style: TextStyle(
                        fontFamily: 'caros',
                        fontSize: 68,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'caros',
                          fontSize: 100.0,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          height: 1.2,
                          color: Colors.white,
                        ),
                        children: const [
                          TextSpan(text: 'easily &\n'),
                          TextSpan(text: 'quickly'),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.07),
                    Text(
                      'Our chat app is the perfect way to stay connected with friends and family.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              'assets/images/Facebook-f_Logo-Blue-Logo.wine.png',
                            ),
                          ),
                          SizedBox(width: 16),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              'assets/images/Apple_on.png',
                            ),
                          ),
                          SizedBox(width: 16),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              'assets/images/google-logo.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Signup(),
                              ),
                          );
                        },
                        child: const Text('Sign up with mail'),

                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginInScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Existing account? Log in',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
