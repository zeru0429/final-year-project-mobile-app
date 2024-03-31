// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:mobile/screens/signin_screen.dart';
import 'package:mobile/widgets/buttons/appbar_button.dart';
import 'package:mobile/widgets/input/lablelled_form_input.dart';

import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/button_style.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBackButton(),
                    const SizedBox(height: 40),
                    Text(
                      'SignUp',
                      style: GoogleFonts.lato(
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 30),
                    LabelledFormInput(
                      placeholder: "Email",
                      keyboardType: "text",
                      controller: _emailcontroller,
                      obscureText: true,
                      label: "email",
                    ),
                    const SizedBox(height: 40),
                    LabelledFormInput(
                      placeholder: "Password",
                      keyboardType: "text",
                      controller: _passwordcontroller,
                      obscureText: false,
                      label: "Your Password",
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyles.blueRounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                          );
                        },
                        // style: ButtonStyles.blueRounded,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "i do have account",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .colorScheme
                                .secondary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
