import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:layop/pages/student_home.dart';
import 'package:layop/service/auth_service.dart';
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
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String error = "";
  bool loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    setState(() {
      loading = true;
    });
    try {
      await AuthService.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } catch (e) {
      setState(() {
        error = e.toString();
      });
      log(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
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
                KHeight(height: AppConstant.largeSpace),
                KFormField(
                  controller: _emailController,
                  hint: "Enter your email",
                ),
                KHeight(height: AppConstant.largeSpace),
                KFormField(
                  controller: _passwordController,
                  hint: "Enter your password",
                ),
                KHeight(height: AppConstant.largeSpace),
                if (loading) const CircularProgressIndicator(),
                if (!loading) KButtonPrimary(text: "Login", function: login),
                KText(
                  text: error,
                  color: AppConstant.dangerColor,
                ),
              ]),
            )),
      ),
    );
  }
}
