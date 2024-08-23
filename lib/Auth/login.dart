import 'package:flutter/material.dart';
import 'package:to_do_app/Auth/custom_text_form_field.dart';
import 'package:to_do_app/Auth/register.dart';
import 'package:to_do_app/app_color.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.backgroundColorLight,
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
        bottomNavigationBar: InkWell(
          overlayColor: WidgetStateColor.transparent,
          onTap: () {
            Navigator.pushNamed(context, RegisterScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                    text: " Don't have an Account?",
                  ),
                  TextSpan(
                    text: " Sing Up",
                  ),
                ])),
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Row(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter Your Email";
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "EX:example@gmail.com";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter Your Password";
                      }
                      if (value.length < 8) {
                        return "Password Should be at least 8 Chars.";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState?.validate() == true) {}
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Stack(
//       children: [
//         Scaffold(
//           appBar: AppBar(
//             title: Text("Create Account"),
//             centerTitle: true,
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//         Image.asset(
//           "assets/images/bg.png",
//           fit: BoxFit.fill,
//           width: double.infinity,
//           height: double.infinity,
//         ),
//
//       ],
//     )
