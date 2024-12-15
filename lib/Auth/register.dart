import 'package:flutter/material.dart';
import 'package:to_do_app/Auth/custom_text_form_field.dart';
import 'package:to_do_app/Auth/login.dart';
import 'package:to_do_app/app_color.dart';
import 'package:to_do_app/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColor.backgroundColorLight,
          image: const DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: InkWell(
          overlayColor: WidgetStateColor.transparent,
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: const Padding(
            padding: EdgeInsets.all(40.0),
            child:Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                    text: " I have an Account?",
                  ),
                  TextSpan(
                    text: " Login",
                  ),
                ])),
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Create Account"),
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height*0.14,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "User Name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter User Name";
                      }
                      return null;
                    },
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
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@gmail+\.com+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "EX:example@gmail.com";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    suff: IconButton(
                        onPressed: () {
                          showPassword = !showPassword;
                          setState(() {});
                        },
                        icon: showPassword
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility)),
                    controller: passwordController,
                    obscureText: showPassword,
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
                  CustomTextFormField(
                    label: "Confirm Password",
                    keyboardType: TextInputType.number,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please Enter Your Confirm Password";
                      }
                      if (value != passwordController.text) {
                        return "Password Doesn't match.";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState?.validate() == true) {}
                      },
                      child: Text("Create Account")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                    child: Text("Guset"),
                  ),

                  const Text("mahmoud")
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
