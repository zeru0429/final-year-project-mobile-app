import 'package:flutter/material.dart';
import 'package:mobile/screens/signup_screen.dart';
import 'package:mobile/screens/user/user_layout.dart';
import 'package:mobile/style/button_style.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:mobile/providers/theme_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/widgets/input/lablelled_form_input.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                    const SizedBox(height: 40),
                    Text(
                      'Login',
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
                    RichText(
                      text: TextSpan(
                        text: 'Using  ',
                        style: GoogleFonts.lato(
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .colorScheme
                              .secondary,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'email and password',
                            style: TextStyle(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "  to login.",
                            style: GoogleFonts.lato(
                              color: Provider.of<ThemeProvider>(context)
                                  .themeData
                                  .colorScheme
                                  .surface,
                            ),
                          ),
                        ],
                      ),
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserAppLayout(),
                            ),
                            (route) => false,
                          );
                        },
                        // style: ButtonStyles.blueRounded,
                        child: Text(
                          'Sign In',
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
                          "i don\'t have an account? ",
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
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'signup',
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
