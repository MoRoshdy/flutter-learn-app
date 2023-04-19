// ignore_for_file: avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_learn_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool obscure = true;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    keyboardtype: TextInputType.emailAddress,
                    labeltext: 'Email',
                    prefix: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write an email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: passController,
                    keyboardtype: TextInputType.visiblePassword,
                    labeltext: 'Password',
                    prefix: Icons.lock,
                    suffix: obscure ? Icons.visibility : Icons.visibility_off,
                    obscure: obscure,
                    suffixpressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write an password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passController.text);
                      }
                    },
                    text: 'login',
                    radius: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      print(emailController.text);
                      print(passController.text);
                    },
                    text: 'Register',
                    isUpperCase: false,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
