import 'package:flutter/material.dart';
import 'package:food_market/view/components/custom_elevated_button.dart';
import 'package:food_market/view/components/custom_text_form_field.dart'
    show CustomTextFormField;
import 'package:food_market/view/pages/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<SignupPage> createState() => _LoginState();
}

class _LoginState extends State<SignupPage> {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.controller,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0XFF3B3B3B),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextFormField(
                controller: emailController,
                isObsecure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Text(
              "Email Address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0XFF3B3B3B),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextFormField(
                controller: emailController,
                isObsecure: false,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!value.contains("@")) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
      
            Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0XFF3B3B3B),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomTextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Please enter at least 6 characters";
                  } else {
                    return null;
                  }
                },
                isObsecure: isObsecureText,
                suffixIcon: IconButton(
                  icon: Icon(
                    isObsecureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: (){
                    setState(() {
                      isObsecureText = !isObsecureText;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                },
                colors: [Color(0XFFD61355), Color(0XFFFF0000)],
                verticalPadding: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "sign up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: CustomElevatedButton(
                onTap: () {},
                color: Colors.grey.shade300,
                verticalPadding: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset('assets/icons/google_icon.png'),
                    ),
                    Text(
                      "Sign up with Google",
                      style: TextStyle(
                        fontSize: 16, // Adjust text size
                        fontWeight: FontWeight.w600, // Adjust text weight
                        color: Colors.black, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
