import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/Screen/pickers/user_image_picker.dart';
import 'package:real_estate/bloc/Auth_bloc/auth_bloc.dart';

class Regester extends StatelessWidget {
  const Regester({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    bool obscureText = true;
    File? userimageFile;
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    void pickedImage(File pickedImage) {
      userimageFile = pickedImage;
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Registererrstate) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
          ));
        } else if (state is SuccessRegesterState) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home',(route)=>false);
        }
      },
      builder: (context, state) {
        if (state is ShowpasswordState) {
          obscureText = !obscureText;
        }
        if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 170,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 245, 133, 171),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(130))),
                      ),
                    ),
                    Center(
                      child: Image.asset('images/S.jpg'),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    UserImagePicker(imagepickfn: pickedImage),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        key: const ValueKey('email'),
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return 'please enter a valid email address and contains @';
                          }
                          return null;
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 245, 223, 248),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            hintText: 'Your Email'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        key: const ValueKey('password'),
                        validator: (val) {
                          if (val!.isEmpty || val.length < 7) {
                            return 'please enter at least 7 characters';
                          }
                          return null;
                        },
                        controller: passwordcontroller,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 245, 223, 248),
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: Theme.of(context).primaryColor,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(ShowpasswordEvent());
                                },
                                icon: Icon(obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            hintText: 'Password'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        key: const ValueKey('phone'),
                        validator: (val) {
                          if (val!.isEmpty || val.length < 10) {
                            return 'please enter at least 10 characters';
                          }
                          return null;
                        },
                        controller: phonecontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 245, 223, 248),
                            prefixIcon: const Icon(Icons.phone),
                            prefixIconColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            hintText: 'Your Phone '),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    SizedBox(
                        height: 65,
                        width: 350,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            final bool? isValid =
                                formkey.currentState?.validate();
                            FocusScope.of(context).unfocus();

                            if (userimageFile == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('Please pick an image'),
                                backgroundColor:
                                    Theme.of(context).colorScheme.error,
                              ));
                              return;
                            }

                            if (isValid!) {
                              BlocProvider.of<AuthBloc>(context).add(
                                  RegesterEvent(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text,
                                      phone: phonecontroller.text,
                                      image: userimageFile));
                            }
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an Account ? ',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).popAndPushNamed('login');
                            },
                            child: const Text(
                              'sign In',
                              style: TextStyle(fontSize: 23),
                            ))
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
