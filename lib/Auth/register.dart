import 'package:flutter/material.dart';
import 'package:to_do_app/Auth/custom_text_form_field.dart';
import 'package:to_do_app/app_color.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  RegisterScreen({super.key});

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Create Account"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
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
                    child: Text("Create Account"))
              ],
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
