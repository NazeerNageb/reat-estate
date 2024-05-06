import 'package:flutter/material.dart';

class fisrtpage extends StatelessWidget {
  const fisrtpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'images/splash.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Center(
                  child: Text(
                'Welcome ',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 44,
                    color: Colors.white),
              )),
              const Spacer(),
              SizedBox(
                  height: 65,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 65,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {Navigator.of(context).pushNamed('sign');},
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 24),
                    ),
                  )),
              const SizedBox(
                height: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}
