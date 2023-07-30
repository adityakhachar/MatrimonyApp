import 'package:flutter/material.dart';
import 'package:matrimony_app/Functions/AuthFunction.dart';
import 'package:matrimony_app/Components/my_button.dart';
import 'package:matrimony_app/Components/my_textfield.dart';
import 'package:matrimony_app/Components/square_tile.dart';

class AuthDemo extends StatefulWidget {
  const AuthDemo({super.key});

  @override
  State<AuthDemo> createState() => _AuthDemoState();
}

class _AuthDemoState extends State<AuthDemo> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = "";
  String password = "";
  String username = "";
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 50,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        !isLogin
                            ? Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400),
                                        ),
                                        fillColor: Colors.grey.shade200,
                                        filled: true,
                                        hintText: "Enter Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[500])),
                                    key: ValueKey('username'),
                                    // decoration:
                                    //     InputDecoration(hintText: "Enter Username"),
                                    validator: (value) {
                                      if (value.toString().length < 3) {
                                        return 'Username is so small';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (newValue) {
                                      setState(() {
                                        username = newValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10),
                                ],
                              )
                            : Container(),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          key: ValueKey('email'),
                          // decoration: InputDecoration(hintText: "Enter Email"),
                          validator: (value) {
                            if (!(value.toString().contains('@'))) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            setState(() {
                              email = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Colors.grey[500])),
                          key: ValueKey('password'),
                          // decoration: InputDecoration(hintText: "Enter Password"),
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return 'Password is so small';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (newValue) {
                            setState(() {
                              password = newValue!;
                            });
                          },
                          obscureText: true,
                        ),

                        const SizedBox(height: 10),

                        // forgot password?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              isLogin
                                  ? Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.grey[600]),
                                    )
                                  : Text("")
                            ],
                          ),
                        ),

                        const SizedBox(height: 25),

                        // sign in button
                        // MyButton(
                        //   onTap: isLogin
                        //       ? signIn(email, password)
                        //       : signUp(email, password),
                        // ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                //borderRadius: BorderRadius.zero, //Rectangular border
                              ),
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                _formkey.currentState!.save();
                                isLogin
                                    ? signIn(email, password)
                                    : signUp(email, password);
                              }
                            },
                            child: isLogin
                                ? Text("Login",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black))
                                : Text("SignUp",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black))),
                      ],
                    )),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'lib/Assets/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'lib/Assets/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLogin
                        ? Text(
                            'Not a member?',
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        : Text(
                            'Already Member?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                    const SizedBox(width: 4),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: isLogin
                            ? Text("Register Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ))
                            : Text("Login",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                )))
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
