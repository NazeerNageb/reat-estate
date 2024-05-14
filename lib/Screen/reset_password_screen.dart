import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        clipBehavior: Clip.hardEdge,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/reset.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 350,
            ),
            const Text(
              'Enter Your Email and we will send you a password rest link',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(8)),
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
            const Padding(padding: EdgeInsets.all(8)),
            SizedBox(
                height: 65,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor)),
                  onPressed: passwordreset,
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.toString());
           showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent ! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }
}
