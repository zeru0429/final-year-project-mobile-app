// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile/providers/auth.dart';
import 'package:mobile/screens/signup_screen.dart';
import 'package:mobile/screens/user/user_layout.dart';
import 'package:mobile/services/auth_service.dart';
import 'package:mobile/services/message_service.dart';
import 'package:mobile/style/button_style.dart';
import 'package:mobile/util/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:mobile/providers/theme_provider.dart';
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
  String? token;
  bool isLoading = false; // Added loading state

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    token = await getToken();
    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UserAppLayout()),
          (route) => false);
    }
  }

  Future<void> handleSubmit() async {
    print("-------------------start send ing request -----------------");

    if (isLoading) return;
    //if user email input empty
    if (_emailcontroller.text.isEmpty) {
      SnackBarService.showSnackBar(
          context, 'email fields is required', Colors.redAccent);
      return;
    }
    //if user password input empty
    if (_passwordcontroller.text.isEmpty) {
      SnackBarService.showSnackBar(
          context, 'password fields is required', Colors.redAccent);
      return;
    }
    // Set loading state to true when the button is clicked
    setState(() {
      isLoading = true;
    });
    // prepare  json data
    final jsonData = {
      "email": _emailcontroller.text,
      "password": _passwordcontroller.text,
    };
    //send api request
    AuthService authService = AuthService();
    final response = await authService.signInService(jsonData);
    //handle response
    if (response['success'] != true) {
      //show message
      SnackBarService.showSnackBar(
          context, response['message'], Colors.redAccent);
    } else {
      //show message
      SnackBarService.showSnackBar(
          context, response['message'], Colors.greenAccent);
      //start feching user data
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Provider.of<AuthProvider>(context, listen: false).prepareAuthData();
      });
      //navigate to home page
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const UserAppLayout()),
          (route) => false);
    }
    setState(() {
      isLoading = false; // Set loading state to true when the button is clicked
    });
  }

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
                    Center(
                      child: isLoading
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: SizedBox(
                                width: 60,
                                height: 30,
                                child: CircularProgressIndicator(
                                  semanticsLabel: 'loading...',
                                  color: Provider.of<ThemeProvider>(context)
                                      .themeData
                                      .colorScheme
                                      .secondary,
                                  backgroundColor:
                                      Provider.of<ThemeProvider>(context)
                                          .themeData
                                          .colorScheme
                                          .background,
                                ),
                              ),
                            ) // Show loading indicator
                          : SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                style: ButtonStyles.blueRounded,
                                onPressed: () {
                                  handleSubmit();
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
