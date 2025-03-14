import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Row(
                  children: [
                    Text("Spedah",
                        style: GoogleFonts.sora(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        )),
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xFFF9C74F),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        'assets/images/Untitled_design-removebg-preview.png', // Background image
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Hero(
                        tag: 'bikeAnimation',
                        child: Image.asset(
                          'assets/images/Untitled_design__1_-removebg-preview.png',
                          width: 350,
                          height: 200, // Animated bike image
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's",
                      style: GoogleFonts.sora(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text("get started",
                        style: GoogleFonts.sora(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    Text("Everything starts from here",
                        style: GoogleFonts.sora(
                            fontSize: 16, color: Colors.white60)),
                    const SizedBox(height: 30),
                    // CustomButton(
                    //   text: "Log in",
                    //   color: const Color(0xFFF9C74F), // Yellow button
                    //   textColor: Colors.black,
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         CupertinoPageRoute(
                    //             builder: (context) => const LoginScreen()));
                    //   },
                    // ),
                    // const SizedBox(height: 10),
                    // CustomButton(
                    //   text: "Sign up",
                    //   color: AppColors.buttonGray,
                    //   textColor: Colors.black,
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         CupertinoPageRoute(
                    //             builder: (context) => const SignupPage()));
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
