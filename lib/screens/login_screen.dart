import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibrant/resources/auth_methods.dart';
import 'package:vibrant/responsive/mobile_screen_layou.dart';
import 'package:vibrant/responsive/responsive_layout_screen.dart';
import 'package:vibrant/responsive/web_screen_layout.dart';
import 'package:vibrant/screens/signup_screen.dart';
import 'package:vibrant/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
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
                SizedBox(
                  height: 19,
                ),
                Container(
                  height: 50,
                  width: 150,
                  color: Colors.blue,
                  child: ElevatedButton(
                    onPressed: () {
                      logInUser();
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Log in'),
                  ),
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
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: navigateToSignUp,
                          child: Container(
                            child: const Text(
                              'SignUp',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
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

  logInUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout()),
      ));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      isLoading = false;
    });
  }

  void showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }

  void navigateToSignUp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ));
  }
}
