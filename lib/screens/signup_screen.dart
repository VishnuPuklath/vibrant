import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibrant/resources/auth_methods.dart';
import 'package:vibrant/responsive/mobile_screen_layou.dart';
import 'package:vibrant/responsive/responsive_layout_screen.dart';
import 'package:vibrant/responsive/web_screen_layout.dart';
import 'package:vibrant/utils/utils.dart';
import 'package:vibrant/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
    _passwordController.clear();
    _bioController.clear();
    _usernameController.clear();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1H81w4SmKH5DZmIbxU7EB0aMSkNQDoPQA1mRQxf2Y0wMF1NSa7vghbwwKASi1q4NPmNw&usqp=CAU'),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            color: Colors.white,
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldInput(
                        textEditingController: _usernameController,
                        hintText: 'Enter your username',
                        textInputType: TextInputType.text),
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
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldInput(
                        textEditingController: _bioController,
                        hintText: 'Enter your bio',
                        textInputType: TextInputType.text),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      color: Colors.blue,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          String res = await AuthMethods().signUpUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                              bio: _bioController.text,
                              file: _image!);
                          setState(() {
                            isLoading = false;
                          });
                          if (res != 'success') {
                            showSnackBar(res, context);
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ResponsiveLayout(
                                    mobileScreenLayout: MobileScreenLayout(),
                                    webScreenLayout: WebScreenLayout()),
                              ),
                            );
                          }
                        },
                        child: isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text('SignUp'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }
}
