import 'package:flutter/material.dart';
import 'package:layop/pages/student_home.dart';
import 'package:layop/util/app_constant.dart';

import 'package:layop/widget/k_button.dart';
import 'package:layop/widget/k_form_field.dart';
import 'package:layop/widget/k_height.dart';
import 'package:layop/widget/k_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  String? errorMessage = '';
  bool? isLoading = false;

  @override
  void dispose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.dispose();
  }

  // Future<void> login() async {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (conext) => AlertDialog(
  //             title: Column(children: const <Widget>[
  //               Text("please wait ..."),
  //               KHeight(height: 10),
  //               LinearProgressIndicator(),
  //             ]),
  //           ));
  //   try {
  //     await AuthService.signIn(
  //         email: textEmailController.text,
  //         password: textPasswordController.text);
  //     navigatorKey.currentState!.popUntil((route) => route.isFirst);
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const ParentHome(),
  //         ));
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });

  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(errorMessage.toString())));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.horizontalPagePadding,
                vertical: AppConstant.verticalPagePadding),
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: const [
                    KText(
                      text: "Login",
                      color: AppConstant.titleTextColor,
                      size: AppConstant.leadingText,
                      weight: FontWeight.w800,
                    ),
                  ],
                ),
                const KHeight(height: AppConstant.largeSpace),
                Row(
                  children: const [
                    Flexible(
                      child: KText(
                        color: AppConstant.bodyTextColor,
                        text: "Enter your credential to connect you in the app",
                        size: AppConstant.informationText,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const KHeight(height: AppConstant.largeSpace),
                KFormField(
                  controller: textEmailController,
                  hint: "Enter your email",
                ),
                const KHeight(height: AppConstant.largeSpace),
                KFormField(
                  controller: textPasswordController,
                  hint: "Enter your password",
                ),
                const KHeight(height: AppConstant.largeSpace),
                KButtonPrimary(
                    text: "Login",
                    function: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ParentHome()))),
              ]),
            )),
      ),
    );
  }
}
