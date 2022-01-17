import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibrant/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Image.asset(
                  'assets/user.jpg',
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'Please enter your email',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 30,
                ),
                TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: 'Please enter your password',
                    textInputType: TextInputType.text,
                    isPass: true),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Log in'),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('Dont you have an account?'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Text('SignUp'),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
