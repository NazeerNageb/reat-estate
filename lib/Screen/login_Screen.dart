import 'package:flutter/material.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 170,
                height: 150,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 245, 133, 171),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(130))),
              ),
            ),
            Center(
              child: Image.asset('images/S.jpg'),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            SizedBox(
              width: 350,
              child: TextFormField(
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
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 223, 248),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: Theme.of(context).primaryColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    hintText: 'Password'),
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
                      color: Theme.of(context).primaryColor, fontSize: 20,fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {Navigator.of(context).popAndPushNamed('sign');},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
