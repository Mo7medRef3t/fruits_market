// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/core/utils/size_config.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/data/respotireis/auth_repo_impl.dart';
import 'package:get/get.dart';
import '../../../../../Screens/screens.dart';
import '../../complete_information/complete_information_view.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 700),
        lowerBound: 0.2,
        upperBound: 1);
    animationController?.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future<void> _loginWithEmail(String email, String password) async {
    final result = await AuthRepoImpl().loginWithEmail(email, password);

    result.fold(
      (exception) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(exception.toString())));
      },
      (userCredential) {
        Get.to(
          () => CompleteInformationView(userCredential: userCredential),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }

  Future<void> _signUpWithEmail(String email, String password) async {
    final result = await AuthRepoImpl().signUpWithEmail(email, password);

    result.fold(
      (exception) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(exception.toString())));
      },
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "A verification email has been sent. Please verify your email to complete registration.\n After verfing your email go back to login this time")));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              "Hello Again",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            minVerticalPadding: 10,
            subtitle: Text(
              "Welcome Back You've Been Missed!",
              style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
          ),
          const VerticalSpace(10),
          SizedBox(
              height: SizeConfig.defaultSize! * 20,
              child: Image.asset("images/login view.png")),
          const VerticalSpace(2),
          FadeTransition(
            opacity: animationController!,
            child: const Text(
              "Fruit Market",
              style: TextStyle(
                  color: KMainColor, fontSize: 42, fontWeight: FontWeight.bold),
            ),
          ),
          const VerticalSpace(9),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButtonWithIcon(
                  text: "Log In with",
                  onTap: () async {
                    final result = await AuthRepoImpl().loginWithGoogle();

                    result.fold(
                      (exception) {
                        // في حالة حدوث خطأ، نقوم بعرض رسالة خطأ
                        Get.snackbar("Error", exception.toString());
                      },
                      (userCredential) {
                        // في حالة النجاح، ننتقل إلى الصفحة التالية
                        Get.offAll(
                          () => const Screens(),
                          transition: Transition.fade,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                    );
                  },
                  iconData: FontAwesomeIcons.google,
                  color: const Color(0xFFdb3236),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButtonWithIcon(
                  text: "Log In with",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String loginEmail = "";
                        String loginPassword = "";

                        return AlertDialog(
                          title: const Text("Log In"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  loginEmail = value;
                                },
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                              ),
                              TextField(
                                onChanged: (value) {
                                  loginPassword = value;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: "Password"),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                child: const Text(
                                    "Don't have an account? Sign Up"),
                                onPressed: () {
                                  // Navigate to the Sign Up screen
                                  Navigator.of(context)
                                      .pop(); // Close the login dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String? signUpEmail;
                                      String? signUpPassword;
                                      return AlertDialog(
                                        title: const Text("Sign Up"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                signUpEmail = value;
                                              },
                                              decoration: const InputDecoration(
                                                  labelText: "Email"),
                                            ),
                                            TextField(
                                              onChanged: (value) {
                                                signUpPassword = value;
                                              },
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                  labelText: "Password"),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ElevatedButton(
                                              child: const Text("Sign Up"),
                                              onPressed: () async {
                                                _signUpWithEmail(signUpEmail!,
                                                    signUpPassword!);
                                                Navigator.of(context).pop();
                                              }),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                                child: const Text("Log In"),
                                onPressed: () async {
                                  _loginWithEmail(loginEmail, loginPassword);
                                  Navigator.of(context).pop();
                                }),
                          ],
                        );
                      },
                    );
                  },
                  iconData: Icons.email,
                  color: const Color(0xFF4267B2),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
