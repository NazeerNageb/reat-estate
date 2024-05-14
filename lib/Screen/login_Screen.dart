import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/Screen/reset_password_screen.dart';
import 'package:real_estate/bloc/Auth_bloc/auth_bloc.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    bool obscureText = true;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Registererrstate) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
            ));
          } else if (state is SuccessLoginState) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is ShowpasswordState) {
            obscureText = !obscureText;
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else {
            return SingleChildScrollView(
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
                  SizedBox(
                    width: 350,
                    child: TextFormField(
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
                      obscureText: obscureText,
                      controller: passwordcontroller,
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
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  ResetPasswordScreen()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "forget password",
                          ),
                        ],
                      )),
                  //const Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                      height: 65,
                      width: 350,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColor)),
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(LoignEvent(
                              email: emailcontroller.text,
                              password: passwordcontroller.text));
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don`t have an Account  ? ',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('sign');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
